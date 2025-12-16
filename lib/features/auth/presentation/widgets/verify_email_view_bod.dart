import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_rich_text.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:cure/features/auth/presentation/widgets/pin_section.dart';

class VerifyPhoneViewBody extends StatefulWidget {
  const VerifyPhoneViewBody({super.key, required this.phone});

  final String phone;

  @override
  State<VerifyPhoneViewBody> createState() => _VerifyPhoneViewBodyState();
}

class _VerifyPhoneViewBodyState extends State<VerifyPhoneViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Icon(Icons.email_outlined, color: Color(0xffAFAFAF), size: 32.w),
            24.hs,
            Text('Verify Code', style: AppStyles.textSemiBold18),
            16.hs,
            Text(
              'Please enter the code we just sent to phone\n(${widget.phone})',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            32.hs,
            PinSection(onCompleted: (code) {}),
            16.hs,
            CustomRichText(
              text: 'OTP not receive ? ',
              linkText: 'Send again',
              onTap: () {
                customSnackBar(
                  context: context,
                  message: 'Successfully Send again',
                  type: AnimatedSnackBarType.success,
                );
              },
            ),
            16.hs,
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is AuthLoaded) {
                  customSnackBar(
                    context: context,
                    message: 'Welcome Back',
                    type: AnimatedSnackBarType.success,
                  );
                  context.go(AppRoutes.main);
                }
              },
              builder: (context, state) => CustomButton(
                isLoading: state is AuthLoading,
                title: 'Verify',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<AuthCubit>().verifyCodeWithPhone(
                      phone: widget.phone,
                      code: '1234',
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
