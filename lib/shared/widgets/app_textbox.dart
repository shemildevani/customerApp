import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' show FaIcon;
import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/config/app_constant/app_assets.dart';
import 'package:customer_app/config/app_constant/app_font_size.dart';
import 'package:customer_app/config/utils/app_spacing.dart';
import 'package:customer_app/shared/widgets/required_label.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final bool showSuffixIcon;
  final VoidCallback? onSuffixTap;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onFieldSubmitted;

  const AppTextField({
    required this.hintText,
    required this.controller,
    super.key,
    this.prefixIcon,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.onSuffixTap,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      textInputAction: textInputAction,
      validator: validator,
      style: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
        color: Theme.of(context).highlightColor,
      ),
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        filled: true,
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.red.withValues(alpha: 0.48)),
        ),

        prefixIcon:
            prefixIcon != null
                ? IconButton(
                  onPressed: null,
                  icon: FaIcon(prefixIcon, color: Theme.of(context).focusColor),
                )
                : null,
        suffixIcon:
            showSuffixIcon && suffixIcon != null
                ? IconButton(
                  onPressed: onSuffixTap,
                  icon: FaIcon(suffixIcon, color: Theme.of(context).focusColor),
                )
                : null,
      ),
    );
  }
}

class AppTextField1 extends StatelessWidget {
  final String hintText;
  final String? titleText;
  final TextEditingController controller;
  final bool obscureText;
  final int? maxLines;
  final Widget? prefixIcon;
  final VoidCallback? onSuffixTap;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final bool isRequired;
  final String? helperText;

  const AppTextField1({
    required this.controller,
    required this.hintText,
    super.key,
    this.titleText,
    this.obscureText = false,
    this.onSuffixTap,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.validator,
    this.prefixIcon,
    this.helperText,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredLabel(label: titleText ?? '', isRequired: isRequired),
        AppSpacing.h10,
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: textInputAction,
          validator: validator,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: AppFontSize.s16,
            color: AppColors.black,
            fontWeight: appMediumFont,
          ),

          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            isDense: true,
            hintText: hintText,
            helperText: helperText,
            helperStyle: TextStyle(
              color: AppColors.red,
              fontSize: AppFontSize.s14,
            ),
            helperMaxLines: 2,
            hintStyle: TextStyle(color: AppColors.grey1),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.grey1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.red),
            ),
          ),
        ),
      ],
    );
  }
}
