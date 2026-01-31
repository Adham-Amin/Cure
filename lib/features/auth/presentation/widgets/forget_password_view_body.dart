import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController phone;

  @override
  void initState() {
    phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
            message: 'Check your Phone',
            type: AnimatedSnackBarType.success,
          );
          context.push(AppRoutes.otp, extra: phone.text);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Icon(Icons.key_outlined, color: Color(0xffAFAFAF), size: 32.w),
                24.hs,
                Text('Forgot Password?', style: AppStyles.textSemiBold18),
                16.hs,
                Text(
                  'please enter your Phone number to reset that password',
                  textAlign: TextAlign.center,
                  style: AppStyles.textRegular14.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                32.hs,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone', style: AppStyles.textRegular14),
                ),
                4.hs,
                CustomTextFormField(
                  validator: Validators.phone,
                  controller: phone,
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icon(Icons.phone_outlined),
                ),
                16.hs,
                CustomButton(
                  isLoading: state is AuthLoading,
                  title: 'Send Code',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<AuthCubit>().forgotPassword(
                        phone: phone.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
