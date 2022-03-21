import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> viewProfile(String token);
  Future<Either<Failure, Profile>> editProfile({
    required String token,
    required Profile updatedProfile,
  });
}
