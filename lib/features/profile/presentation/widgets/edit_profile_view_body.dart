import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:cure/features/auth/presentation/widgets/profile_image_picker.dart';
import 'package:cure/features/auth/presentation/widgets/select_birth_date.dart';
import 'package:cure/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late TextEditingController _nameController,
      _emailController,
      _bithdateController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _bithdateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bithdateController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.hs,
            ProfileImagePicker(
              onPick: (file) {
                setState(() => this.file = file);
              },
              file: file,
            ),
            32.hs,
            CustomTextFormField(
              hintText: Prefs.getUser()!.name,
              prefixIcon: Icon(Icons.person),
              controller: _nameController,
            ),
            16.hs,
            CustomTextFormField(
              controller: _emailController,
              hintText: Prefs.getUser()!.email,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            16.hs,
            SelectBirthDate(controller: _bithdateController),
            32.hs,
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileError) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    type: AnimatedSnackBarType.error,
                  );
                }
                if (state is ProfileLoaded) {
                  context.pop(true);
                  customSnackBar(
                    context: context,
                    message: 'Profile updated successfully',
                    type: AnimatedSnackBarType.success,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is ProfileLoading,
                  title: 'Update',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (file != null ||
                          _nameController.text.isNotEmpty ||
                          _emailController.text.isNotEmpty ||
                          _bithdateController.text.isNotEmpty) {
                        context.read<ProfileCubit>().updateProfile(
                          data: RegisterRequest(
                            name: _nameController.text,
                            birthdate: _bithdateController.text,
                            email: _emailController.text,
                            profilePhoto: file,
                          ),
                        );
                      } else {
                        customSnackBar(
                          context: context,
                          message: 'Please Update at least one field',
                          type: AnimatedSnackBarType.warning,
                        );
                      }
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
