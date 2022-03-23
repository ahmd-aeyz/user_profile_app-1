import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/profile/data/datasources/profile_service.dart';
import 'package:final_project/features/profile/data/models/profile_model.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileService profileService;
  LocalDataSource localDataSource;
  ProfileRepositoryImpl({
    required this.profileService,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Profile>> viewProfile() async {
    try {
      final token = localDataSource.getToken()!;
      final profile = await profileService.viewProfile(token: 'Bearer $token');
      return right(profile);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Profile>> editProfile(
    EditProfileData editProfileData,
  ) async {
    try {
      final token = localDataSource.getToken()!;
      Profile profile;
      if (editProfileData.imageFile != null) {
        final uploadedImageUrl = await profileService.updateImage(
          image: editProfileData.imageFile!,
        );
        profile = await profileService.editProfile(
          token: 'Bearer $token',
          profileData: ProfileData(
            name: editProfileData.name,
            email: editProfileData.email,
            phone: editProfileData.phone,
            imageUrl: uploadedImageUrl,
            address: editProfileData.address,
            age: editProfileData.age,
          ),
        );
      }
      profile = await profileService.editProfile(
        token: 'Bearer $token',
        profileData: ProfileData(
          name: editProfileData.name,
          email: editProfileData.email,
          phone: editProfileData.phone,
          address: editProfileData.address,
          age: editProfileData.age,
        ),
      );
      return right(profile);
    } catch (error) {
      return left(Failure(error));
    }
  }
}
