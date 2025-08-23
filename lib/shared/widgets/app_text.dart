import 'package:flutter/material.dart';
import 'package:customer_app/config/app_color/app_color.dart';

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final TextOverflow? overFlow;
  final FontStyle? fontStyle;
  final bool softWrap;
  final int? maxLines;
  final TextStyle? style;
  const AppText({
    super.key,
    required this.text,
    this.fontSize,
    this.overFlow,
    this.color,
    this.fontWeight,
    this.decoration,
    this.textAlign,
    this.fontStyle,
    this.maxLines,
    this.softWrap = true,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      overflow: overFlow,
      softWrap: softWrap,
      maxLines: maxLines,
      style:
          style ??
          theme.textTheme.bodyMedium?.copyWith(
            fontSize: fontSize,

            color: color ?? AppColors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: decoration ?? TextDecoration.none,
            fontStyle: fontStyle ?? FontStyle.normal,
          ),
    );
  }
}
