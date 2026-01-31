import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cure/features/auth/data/models/requests/register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cure/core/functions/extentions.dart';
import 'package:cure/core/functions/validators.dart';
import 'package:cure/core/routes/app_routes.dart';
import 'package:cure/core/widgets/custom_button.dart';
import 'package:cure/core/widgets/custom_snack_bar.dart';
import 'package:cure/core/widgets/custom_text_form_field.dart';
import 'package:cure/core/widgets/custom_text_form_field_password.dart';
import 'package:cure/features/auth/presentation/manager/cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController _emailController,
      _passController,
      _confirmPassController,
      _nameController,
      _phoneController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    _nameController = TextEditingController();
    _confirmPassController = TextEditingController();
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            validator: Validators.name,
            hintText: 'Ex: Adham Amin',
            prefixIcon: Icon(Icons.person),
            controller: _nameController,
          ),
          16.hs,
          CustomTextFormField(
            validator: Validators.phone,
            controller: _phoneController,
            hintText: '01*********',
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11),
            ],
            prefixIcon: Icon(Icons.phone_outlined),
          ),
          16.hs,
          CustomTextFormField(
            validator: Validators.email,
            controller: _emailController,
            hintText: 'eng.adham@example.com',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          16.hs,
          CustomTextFormFieldPassword(
            hintText: 'Password',
            controller: _passController,
            validator: Validators.password,
          ),
          16.hs,
          CustomTextFormFieldPassword(
            hintText: 'Confirm Password',
            controller: _confirmPassController,
            validator: (value){
              if(value != _passController.text){
                return 'Password does not match';
              }
              return null;
            },
          ),

          24.hs,
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
                context.go(AppRoutes.verifyPhone, extra: _phoneController.text);
                customSnackBar(
                  context: context,
                  message: 'Please verify your phone number',
                  type: AnimatedSnackBarType.success,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AuthLoading,
                title: 'Sign Up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<AuthCubit>().register(
                      registerRequest: RegisterRequest(
                        email: _emailController.text,
                        password: _passController.text,
                        name: _nameController.text,
                        phone: _phoneController.text,
                        passwordConfirmation: _passController.text,
                      ),
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
    );
  }
}
