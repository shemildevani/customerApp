import 'dart:math' as math;
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/screens/business_screen/business_screen.dart';
import 'package:customer_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerScreen extends StatefulWidget {
  const QrCodeScannerScreen({super.key});

  @override
  State<QrCodeScannerScreen> createState() => _QrCodeScannerScreenState();
}

class _QrCodeScannerScreenState extends State<QrCodeScannerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);
    // Lock to portrait if you want
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cornerColor = AppColors.primary;

    return Scaffold(
      appBar: buildAppBar(title: 'Scan Business QR'),
      body: Stack(
        children: [
          // Camera
          Positioned.fill(
            child: MobileScanner(
              onDetect: (capture) {
                if (capture.barcodes.isNotEmpty) {
                  final String code = capture.barcodes.first.rawValue ?? '---';
                  debugPrint('500001=======>Barcode found! $code');
                  Get.off(() => BusinessScreen());
                }
              },
              // The overlayBuilder renders *above* the camera preview
              overlayBuilder: (context, constraints) {
                return ScannerOverlay(
                  constraints: constraints,
                  animation: _controller,
                  cornerColor: cornerColor,
                );
              },
            ),
          ),

          // Optional: Small hint text at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 28,
            child: Center(
              child: Text(
                'Align QR inside the frame',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Overlay with:
/// - Dimmed background
/// - Transparent square cutout
/// - Corner borders
/// - Animated center "light" (laser) line
class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({
    super.key,
    required this.constraints,
    required this.animation,
    this.cornerColor = Colors.blue,
    this.borderThickness = 4,
    this.cornerLength = 28,
    this.cutOutRatio = 0.72, // percentage of shortest side
    this.cutOutMin = 240,
    this.cutOutMax = 360,
    this.borderRadius = 16,
  });

  final BoxConstraints constraints;
  final Animation<double> animation;
  final Color cornerColor;
  final double borderThickness;
  final double cornerLength;
  final double cutOutRatio;
  final double cutOutMin;
  final double cutOutMax;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final size = Size(constraints.maxWidth, constraints.maxHeight);
    final shortest = math.min(size.width, size.height);
    final cut = shortest * cutOutRatio;
    final cutOutSize = cut.clamp(cutOutMin, cutOutMax);
    final cutOutRect = Rect.fromCenter(
      center: size.center(Offset.zero),
      width: cutOutSize,
      height: cutOutSize,
    );

    return RepaintBoundary(
      child: Stack(
        children: [
          // Dim + hole
          Positioned.fill(
            child: CustomPaint(
              painter: _DimPainter(
                cutOutRect: cutOutRect,
                radius: borderRadius,
              ),
            ),
          ),

          // Corner borders
          Positioned.fill(
            child: CustomPaint(
              painter: _CornerPainter(
                rect: cutOutRect,
                color: cornerColor,
                thickness: borderThickness,
                length: cornerLength,
                radius: borderRadius,
              ),
            ),
          ),

          // Center moving light (horizontal)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                // Move from top to bottom inside the cutout
                final t = Curves.easeInOut.transform(
                  // Make it loop smoothly: 0→1 then jump back to 0
                  (animation.value % 1.0),
                );
                final y = cutOutRect.top + t * cutOutRect.height;

                return CustomPaint(
                  painter: _LaserPainter(
                    y: y,
                    left: cutOutRect.left,
                    right: cutOutRect.right,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DimPainter extends CustomPainter {
  _DimPainter({required this.cutOutRect, required this.radius});

  final Rect cutOutRect;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()..color = Colors.black.withOpacity(0.55);
    final overlay = Path()..addRect(Offset.zero & size);
    final hole =
        Path()..addRRect(
          RRect.fromRectAndRadius(cutOutRect, Radius.circular(radius)),
        );
    // Even-odd fill: draw full dim, then cut the hole out
    final path = Path.combine(PathOperation.difference, overlay, hole);
    canvas.drawPath(path, bg);
  }

  @override
  bool shouldRepaint(covariant _DimPainter oldDelegate) =>
      oldDelegate.cutOutRect != cutOutRect || oldDelegate.radius != radius;
}

class _CornerPainter extends CustomPainter {
  _CornerPainter({
    required this.rect,
    required this.color,
    required this.thickness,
    required this.length,
    required this.radius,
  });

  final Rect rect;
  final Color color;
  final double thickness;
  final double length;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final p =
        Paint()
          ..color = color
          ..strokeWidth = thickness
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    // Draw rounded border outline (subtle, optional: comment out if not wanted)
    final outline = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    canvas.drawRRect(outline, p..color = color.withOpacity(0.25));

    // Reinstate strong color for corners
    p.color = color;

    // Corner lines (L-shape) at each corner
    // Top-left
    _drawCorner(canvas, p, rect.topLeft, Corner.topLeft);
    // Top-right
    _drawCorner(canvas, p, rect.topRight, Corner.topRight);
    // Bottom-left
    _drawCorner(canvas, p, rect.bottomLeft, Corner.bottomLeft);
    // Bottom-right
    _drawCorner(canvas, p, rect.bottomRight, Corner.bottomRight);
  }

  void _drawCorner(Canvas canvas, Paint p, Offset corner, Corner which) {
    switch (which) {
      case Corner.topLeft:
        canvas.drawLine(corner, corner + Offset(length, 0), p);
        canvas.drawLine(corner, corner + Offset(0, length), p);
        break;
      case Corner.topRight:
        canvas.drawLine(corner, corner + Offset(-length, 0), p);
        canvas.drawLine(corner, corner + Offset(0, length), p);
        break;
      case Corner.bottomLeft:
        canvas.drawLine(corner, corner + Offset(length, 0), p);
        canvas.drawLine(corner, corner + Offset(0, -length), p);
        break;
      case Corner.bottomRight:
        canvas.drawLine(corner, corner + Offset(-length, 0), p);
        canvas.drawLine(corner, corner + Offset(0, -length), p);
        break;
    }
  }

  @override
  bool shouldRepaint(covariant _CornerPainter oldDelegate) =>
      oldDelegate.rect != rect ||
      oldDelegate.color != color ||
      oldDelegate.thickness != thickness ||
      oldDelegate.length != length ||
      oldDelegate.radius != radius;
}

enum Corner { topLeft, topRight, bottomLeft, bottomRight }

class _LaserPainter extends CustomPainter {
  _LaserPainter({required this.y, required this.left, required this.right});

  final double y;
  final double left;
  final double right;

  @override
  void paint(Canvas canvas, Size size) {
    // Center light: a soft horizontal glow + a bright core line
    final core =
        Paint()
          ..color = AppColors.primary
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    // Soft glow using a gradient stroke effect by drawing multiple lines
    final glow =
        Paint()
          ..color = AppColors.primary.withOpacity(0.12)
          ..strokeWidth = 10
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    // Glow
    canvas.drawLine(Offset(left, y), Offset(right, y), glow);
    // Core line
    canvas.drawLine(Offset(left, y), Offset(right, y), core);
  }

  @override
  bool shouldRepaint(covariant _LaserPainter oldDelegate) =>
      oldDelegate.y != y ||
      oldDelegate.left != left ||
      oldDelegate.right != right;
}
