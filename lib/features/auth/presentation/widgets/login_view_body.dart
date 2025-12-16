import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/widgets/custom_rich_text.dart';
import 'package:cure/features/auth/presentation/widgets/header_auth.dart';
import 'package:cure/features/auth/presentation/widgets/login_form.dart';
import 'package:cure/features/auth/presentation/widgets/social_buttons_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          112.hs,
          HeaderAuth(title: 'Welcome Back, Login Now'),
          32.hs,
          LoginForm(),
          24.hs,
          SocialButtonsAndOr(),
          24.hs,
          CustomRichText(
            text: 'Don\'t have an account? ',
            linkText: ' Sign Up',
            onTap: () {
              context.pushReplacement(AppRoutes.register);
            },
          ),
          24.hs,
        ],
      ),
    );
  }
}
