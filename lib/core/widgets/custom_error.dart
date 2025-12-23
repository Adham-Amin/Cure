import 'package:cure/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(child: Text(message, style: AppStyles.textRegular14)),
    );
  }
}
