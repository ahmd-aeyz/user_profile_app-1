import 'package:final_project/core/validation/validators.dart';
import 'package:final_project/core/widgets/custom_elevated_button.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen();
  static const routeName = '/register';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REGISTER',
                style: textTheme.headline1,
              ),
              CustomTextFormField(
                controller: nameController,
                hintText: 'Full name',
                prefixIcon: Icons.person_outline,
                keyboardType: TextInputType.name,
                validator: (value) => generalValidator(
                  value: value,
                  fieldName: 'Name',
                ),
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email Address',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => emailValidator(value),
              ),
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outlined,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => passwordValidator(value),
              ),
              CustomTextFormField(
                controller: phoneController,
                hintText: 'Phone number',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) => phoneValidator(value),
              ),
              const SizedBox(height: 16),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.of(context).pushReplacementNamed(
                      ViewProfileScreen.routeName,
                    );
                  }
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => CustomElevatedButton(
                      label: 'register',
                      onPressed: () =>
                          BlocProvider.of<AuthCubit>(context).register(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: textTheme.headline2,
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    child: const Text('LOGIN'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
