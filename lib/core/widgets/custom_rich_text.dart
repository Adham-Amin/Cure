import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String linkText;
  final VoidCallback? onTap;

  const CustomRichText({
    this.textStyle,
    super.key,
    required this.text,
    required this.linkText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: textStyle ?? AppStyles.textRegular14,
        children: [
          TextSpan(
            text: ' $linkText',
            style:
                textStyle?.copyWith(color: AppColors.primary) ??
                AppStyles.textMedium14.copyWith(color: AppColors.primary),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
