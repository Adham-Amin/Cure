import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/features/update_number/presentation/cubit/update_number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/features/auth/presentation/widgets/pin_section.dart';
import 'package:go_router/go_router.dart';

class UpdateNumOtpViewBody extends StatefulWidget {
  const UpdateNumOtpViewBody({
    super.key,
    required this.number,
    required this.newNumber,
  });

  final String number;
  final String newNumber;

  @override
  State<UpdateNumOtpViewBody> createState() => _UpdateNumOtpViewBodyState();
}

class _UpdateNumOtpViewBodyState extends State<UpdateNumOtpViewBody> {
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
              'Please enter the code we just sent to email\n(${widget.number})',
              textAlign: TextAlign.center,
              style: AppStyles.textRegular14.copyWith(color: AppColors.grey),
            ),
            32.hs,
            PinSection(onCompleted: (code) {}),
            16.hs,
            BlocConsumer<UpdateNumberCubit, UpdateNumberState>(
              listener: (context, state) {
                if (state is UpdateNumberLoaded) {
                  context.pop();
                  customSnackBar(
                    context: context,
                    message: 'Number updated successfully',
                    type: AnimatedSnackBarType.success,
                  );
                }
                if (state is UpdateNumberError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is UpdateNumberLoading,
                  title: 'Verify',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<UpdateNumberCubit>().verifyCode(
                        code: '1234',
                        newNumber: widget.newNumber,
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
