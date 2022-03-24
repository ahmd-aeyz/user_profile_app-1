import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfile implements UseCase<Profile, EditProfileData> {
  ProfileRepository profileRepository;
  EditProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(
    EditProfileData editProfileData,
  ) async =>
      profileRepository.editProfile(editProfileData);
}

class EditProfileData extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final File? imageFile;
  final String? address;
  final String? age;

  const EditProfileData({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.imageFile,
    this.address,
    this.age,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
        imageFile,
        address,
        age,
      ];
}
