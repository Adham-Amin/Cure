import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_styles.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => context.push(AppRoutes.forgetPassword),
        child: Text('Forget Password?', style: AppStyles.textSemiBold14),
      ),
    );
  }
}
