import 'package:final_project/core/presentation/validation/validators.dart';
import 'package:final_project/core/presentation/widgets/custom_elevated_button.dart';
import 'package:final_project/core/presentation/widgets/custom_text_form_field.dart';
import 'package:final_project/core/presentation/widgets/password_text_form_field.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:final_project/features/auth/presentation/screens/register_screen.dart';
import 'package:final_project/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen();
  static const routeName = '/';
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style: textTheme.headline1,
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => emailValidator(value),
              ),
              PasswordTextFormField(controller: passwordController),
              const SizedBox(height: 16),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    navigateToProfile(context);
                  }
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (error) => Center(
                      child: Text(error),
                    ),
                    orElse: () {
                      return CustomElevatedButton(
                        label: 'login',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: textTheme.headline2,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName),
                    child: const Text('REGISTER'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> navigateToProfile(BuildContext context) async {
    await Future.delayed(const Duration(microseconds: 100));
    Navigator.of(context).pushReplacementNamed(
      ViewProfileScreen.routeName,
    );
  }
}
