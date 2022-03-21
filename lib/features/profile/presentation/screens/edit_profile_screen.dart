import 'package:final_project/core/validation/validators.dart';
import 'package:final_project/core/widgets/custom_text_form_field.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen();
  static const routeName = '/edit_profile';
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController jobController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text(error)),
              success: (profile) {
                nameController = TextEditingController(text: profile.name);
                emailController = TextEditingController(text: profile.email);
                passwordController =
                    TextEditingController(text: profile.password);
                phoneController = TextEditingController(text: profile.phone);
                jobController = TextEditingController(text: profile.job);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Change name',
                      keyboardType: TextInputType.name,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Name',
                      ),
                      prefixIcon: Icons.person_outline,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Change email address',
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => emailValidator(value),
                      prefixIcon: Icons.email_outlined,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: 'Change password',
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) => passwordValidator(value),
                      prefixIcon: Icons.lock_outline,
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      hintText: 'Change phone number',
                      keyboardType: TextInputType.phone,
                      validator: (value) => phoneValidator(value),
                      prefixIcon: Icons.phone_outlined,
                    ),
                    CustomTextFormField(
                      controller: jobController,
                      hintText: 'Change job title',
                      keyboardType: TextInputType.name,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Job title',
                      ),
                      prefixIcon: Icons.cases_rounded,
                    ),
                  ],
                );
              },
              orElse: () => Container(),
            );
          },
        ),
      ),
    );
  }
}
