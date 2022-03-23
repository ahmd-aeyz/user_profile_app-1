import 'dart:io';
import 'package:final_project/core/presentation/validation/validators.dart';
import 'package:final_project/core/presentation/widgets/custom_elevated_button.dart';
import 'package:final_project/core/presentation/widgets/custom_text_form_field.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen();
  static const routeName = 'edit_profile';
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController ageController;
  late File? imageFile;
  final _formKey = GlobalKey<FormState>();
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
              success: (user) {
                nameController = TextEditingController(text: user.name);
                emailController = TextEditingController(text: user.email);
                passwordController = TextEditingController();
                phoneController = TextEditingController(text: user.phone);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        imageFile = await _getImage();
                      },
                      child: const Text('Change profile image'),
                    ),
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
                      controller: addressController,
                      hintText: 'Change job title',
                      keyboardType: TextInputType.name,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Address',
                      ),
                      prefixIcon: Icons.home_work_outlined,
                    ),
                    CustomTextFormField(
                      controller: ageController,
                      hintText: 'Change age',
                      keyboardType: TextInputType.number,
                      validator: (value) => generalValidator(
                        value: value,
                        fieldName: 'Age',
                      ),
                      prefixIcon: Icons.home_work_outlined,
                    ),
                    CustomElevatedButton(
                      label: 'submit',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<ProfileCubit>(context).editProfile(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            imageFile: imageFile,
                            address: addressController.text,
                            age: int.parse(ageController.text),
                          );
                        }
                      },
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

  Future<File?> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
