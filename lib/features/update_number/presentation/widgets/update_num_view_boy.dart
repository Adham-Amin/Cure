import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/update_number/presentation/cubit/update_number_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UpdateNumViewBoy extends StatefulWidget {
  const UpdateNumViewBoy({super.key});

  @override
  State<UpdateNumViewBoy> createState() => _UpdateNumViewBoyState();
}

class _UpdateNumViewBoyState extends State<UpdateNumViewBoy> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController currentNumber;
  late TextEditingController newNumber;

  @override
  void initState() {
    currentNumber = TextEditingController();
    newNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    currentNumber.dispose();
    newNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.hs,
            Text('Current Number', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormField(
              controller: currentNumber,
              hintText: 'Current Number',
              keyboardType: TextInputType.phone,
              validator: Validators.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            16.hs,
            Text('New Number', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormField(
              controller: newNumber,
              hintText: 'New Number',
              keyboardType: TextInputType.phone,
              validator: Validators.phone,
              inputFormatters: [
                LengthLimitingTextInputFormatter(11),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            32.hs,
            BlocConsumer<UpdateNumberCubit, UpdateNumberState>(
              listener: (context, state) {
                if (state is UpdateNumberLoaded) {
                  context.pushReplacement(
                    AppRoutes.updateVerifyPhone,
                    extra: {
                      'num': currentNumber.text,
                      'newNum': newNumber.text,
                    },
                  );
                  customSnackBar(
                    context: context,
                    message: 'Please Enter OTP Code, sent to your number',
                    type: AnimatedSnackBarType.info,
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
              builder: (context, state) => CustomButton(
                isLoading: state is UpdateNumberLoading,
                title: 'Update Number',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<UpdateNumberCubit>().updateNumber(
                      number: newNumber.text,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
            32.hs,
          ],
        ),
      ),
    );
  }
}
