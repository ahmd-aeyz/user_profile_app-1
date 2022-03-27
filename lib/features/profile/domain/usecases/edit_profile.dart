import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfile implements UseCase<User, EditProfileData> {
  ProfileRepository profileRepository;
  EditProfile(this.profileRepository);

  @override
  Future<Either<Failure, User>> call(
    EditProfileData editProfileData,
  ) async =>
      profileRepository.editProfile(editProfileData);
}

class EditProfileData extends Equatable {
  final User user;
  final File? imageFile;

  const EditProfileData({
    required this.user,
    this.imageFile,
  });

  @override
  List<Object?> get props => [
        user,
        imageFile,
      ];
}
