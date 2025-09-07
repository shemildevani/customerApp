import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> with WidgetsBindingObserver {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    facing: CameraFacing.back,
    torchEnabled: false,
    formats: [BarcodeFormat.qrCode, BarcodeFormat.aztec, BarcodeFormat.dataMatrix, BarcodeFormat.pdf417, BarcodeFormat.codabar, BarcodeFormat.code39, BarcodeFormat.code93, BarcodeFormat.code128, BarcodeFormat.ean8, BarcodeFormat.ean13, BarcodeFormat.itf, BarcodeFormat.upcA, BarcodeFormat.upcE],
  );

  bool _handlingResult = false; 
  bool _torchOn = false;  

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.dispose();
    super.dispose();
  }

  // Pause camera when app goes background; resume when foreground
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted) return;
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _controller.stop();
        break;
      case AppLifecycleState.resumed:
        _controller.start();
        break;
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
        break;
    }
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_handlingResult) return;
    final barcode = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
    final value = barcode?.rawValue;

    if (value == null || value.isEmpty) return;

    _handlingResult = true;
    HapticFeedback.lightImpact();
    await _controller.stop();

    if (!mounted) return;
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Full-screen camera feed
            MobileScanner(
              controller: _controller,
              onDetect: _onDetect,
            ),

            // Dim overlay with cutout and titles
            const _ScannerOverlay(),

            // Bottom control bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 28,
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _RoundButton(
                      icon: Icons.close,
                      onTap: () => Navigator.of(context).maybePop(),
                    ),
                    const SizedBox(width: 20),
                    _RoundButton(
                      icon: Icons.cameraswitch,
                      onTap: () => _controller.switchCamera(),
                    ),
                    const SizedBox(width: 20),

                    // Version-proof torch toggle (no torchState getter needed)
                    _RoundButton(
                      icon: _torchOn ? Icons.flash_on : Icons.flash_off,
                      onTap: () async {
                        try {
                          await _controller.toggleTorch();
                          if (mounted) setState(() => _torchOn = !_torchOn);
                        } catch (_) {
                          // ignore: handle if needed (e.g., show a SnackBar)
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  const _ScannerOverlay();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cutoutSide = size.width * 0.70;

    return Stack(
      children: [
        // Darkened layer with transparent square (srcOut trick)
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.55),
            BlendMode.srcOut,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: cutoutSide,
                  height: cutoutSide,
                  decoration: const BoxDecoration(
                    color: Colors.black, // required for srcOut
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
            ],
          ),
        ),

        // White border around cutout
        Align(
          alignment: Alignment.center,
          child: Container(
            width: cutoutSide,
            height: cutoutSide,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.white.withOpacity(0.9),
                width: 2,
              ),
            ),
          ),
        ),

        // Title and hint
        Positioned(
          top: MediaQuery.of(context).padding.top + 24,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'Scan QR Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Align the code within the frame',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.85),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _RoundButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 32,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.7), width: 1),
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}