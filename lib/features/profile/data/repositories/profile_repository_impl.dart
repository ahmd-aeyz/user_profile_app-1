import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/features/profile/data/datasources/profile_service.dart';
import 'package:final_project/features/profile/data/models/profile_model.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileService profileService;
  ProfileRepositoryImpl(this.profileService);

  @override
  Future<Either<Failure, Profile>> viewProfile(String token) async {
    try {
      final profile = await profileService.viewProfile(token);
      return right(profile);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Profile>> editProfile({
    required String token,
    required Profile updatedProfile,
  }) async {
    try {
      final profile = await profileService.editProfile(
        token: token,
        profile: updatedProfile as ProfileModel,
      );
      return right(profile);
    } catch (error) {
      return left(Failure(error));
    }
  }
}
