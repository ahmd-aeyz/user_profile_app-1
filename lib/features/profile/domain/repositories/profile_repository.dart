import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> viewProfile();
  Future<Either<Failure, Profile>> editProfile(EditProfileData editProfileData);
}
