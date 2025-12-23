import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_assets.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:cure/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class LoginPhoneViewBody extends StatefulWidget {
  const LoginPhoneViewBody({super.key});

  @override
  State<LoginPhoneViewBody> createState() => _LoginPhoneViewBodyState();
}

class _LoginPhoneViewBodyState extends State<LoginPhoneViewBody> {
  late TextEditingController _phoneController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            32.hs,
            SvgPicture.asset(AppAssets.svgsLogPhone, height: 210.h),
            32.hs,
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Enter your phone number',
                style: AppStyles.textSemiBold24,
              ),
            ),
            32.hs,
            CustomTextFormField(
              hintText: 'Phone Number',
              prefixIcon: Icon(Icons.phone_outlined),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(11),
              ],
              keyboardType: TextInputType.phone,
              validator: Validators.phone,
              controller: _phoneController,
            ),
            32.hs,
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
                  context.read<FavouriteCubit>().getFavourite();
                  customSnackBar(
                    context: context,
                    message: 'Please enter the code we just sent to phone',
                    type: AnimatedSnackBarType.success,
                  );
                  context.go(
                    AppRoutes.verifyPhone,
                    extra: _phoneController.text,
                  );
                }
              },
              builder: (context, state) => CustomButton(
                isLoading: state is AuthLoading,
                title: 'Sign In With Phone',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<AuthCubit>().loginWithPhone(
                      phone: _phoneController.text,
                    );
                  }
                },
              ),
            ),
            24.hs,
          ],
        ),
      ),
    );
  }
}
