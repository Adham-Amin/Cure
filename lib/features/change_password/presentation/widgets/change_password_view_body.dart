import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field_password.dart';
import 'package:cure/features/change_password/presentation/cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late TextEditingController _currentPassword, _newPassword, _confirmPassword;

  @override
  void initState() {
    super.initState();
    _currentPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            48.hs,
            Text('Current Password', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormFieldPassword(
              hintText: '********',
              validator: Validators.password,
              controller: _currentPassword,
            ),
            16.hs,
            Text('New Password', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormFieldPassword(
              hintText: '********',
              validator: Validators.password,
              controller: _newPassword,
            ),
            16.hs,
            Text('Confirm New Password', style: AppStyles.textRegular14),
            4.hs,
            CustomTextFormFieldPassword(
              hintText: '********',
              controller: _confirmPassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != _newPassword.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            32.hs,
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) {
                if (state is ChangePasswordError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is ChangePasswordLoaded) {
                  customSnackBar(
                    context: context,
                    message: 'Password changed successfully',
                    type: AnimatedSnackBarType.success,
                  );
                  context.pop();
                }
              },
              builder: (context, state) {
                return CustomButton(
                  title: 'Change Password',
                  isLoading: state is ChangePasswordLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<ChangePasswordCubit>().changePassword(
                        oldPassword: _currentPassword.text,
                        newPassword: _newPassword.text,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
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
