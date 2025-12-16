import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
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
import 'package:cure/features/auth/presentation/widgets/forget_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passController;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
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
            message: 'Welcome ${state.user!.name}',
            type: AnimatedSnackBarType.success,
          );
          context.go(AppRoutes.main);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: emailController,
                validator: Validators.email,
                hintText: 'eng.adham@example.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              16.hs,
              CustomTextFormFieldPassword(
                hintText: '********',
                controller: passController,
                validator: Validators.password,
              ),
              8.hs,
              ForgetButton(),
              24.hs,
              CustomButton(
                title: 'Log In',
                isLoading: state is AuthLoading,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passController.text,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
