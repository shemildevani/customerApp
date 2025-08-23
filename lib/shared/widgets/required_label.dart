import 'package:flutter/material.dart';

class RequiredLabel extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final double? asteriskSpacing;
  final bool isRequired;

  const RequiredLabel({
    super.key,
    required this.label,
    this.style,
    this.asteriskSpacing = 2.0,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: style ?? const TextStyle(color: Colors.black, fontSize: 14),
        children: [
          if (isRequired)
            WidgetSpan(
              child: Padding(
                padding: EdgeInsets.only(left: asteriskSpacing!),
                child: Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: style?.fontSize ?? 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
