import 'package:final_project/features/profile/domain/entities/profile.dart';

class ProfileData {
  final int? id;
  final String name;
  final String email;
  final String? imageUrl;
  final String? emailVerifiedAt;
  final String? address;
  final String phone;
  final int? age;
  final int? role;
  final String? updatedAt;
  final String? createdAt;

  ProfileData({
    this.id,
    required this.name,
    required this.email,
    this.imageUrl,
    this.emailVerifiedAt,
    this.address,
    required this.phone,
    this.age,
    this.role,
    this.updatedAt,
    this.createdAt,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        id: json['id'] as int,
        name: json['name'] as String,
        email: json['email'] as String,
        imageUrl: json['image'] as String,
        emailVerifiedAt: json['email_verified_at'] as String?,
        address: json['address'] as String?,
        phone: json['phone'] as String,
        age: json['age'] as int?,
        role: json['role'] as int?,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'image': imageUrl,
        'address': address,
        'phone': phone,
        'age': age,
      };
}

class ProfileModel extends Profile {
  final ProfileData profileData;
  final String message;
  final int status;
  ProfileModel({
    required this.profileData,
    required this.message,
    required this.status,
  }) : super(
          name: profileData.name,
          email: profileData.email,
          phone: profileData.phone,
          imageUrl: profileData.imageUrl!,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        profileData: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String,
        status: json['status'] as int,
      );
}
