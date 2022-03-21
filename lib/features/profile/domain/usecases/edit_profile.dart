import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfile extends UseCase<Profile, EditProfileData> {
  ProfileRepository profileRepository;
  EditProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(
    EditProfileData editProfileData,
  ) async =>
      profileRepository.editProfile(
        token: editProfileData.token,
        updatedProfile: editProfileData.profile,
      );
}

class EditProfileData extends Equatable {
  final String token;
  final Profile profile;

  const EditProfileData({
    required this.token,
    required this.profile,
  });

  @override
  List<Object?> get props => [
        token,
        profile,
      ];
}
