import 'package:final_project/features/profile/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String imageUrl,
    required String job,
  }) : super(
          name: name,
          email: email,
          password: password,
          phone: phone,
          imageUrl: imageUrl,
          job: job,
        );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'imageUrl': imageUrl,
        'job': job,
      };

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phone: json['phone'] as String,
        imageUrl: json['imageUrl'] as String,
        job: json['job'] as String,
      );
}
