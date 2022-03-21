import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ViewProfile extends UseCase<Profile, ViewProfileData> {
  ProfileRepository profileRepository;
  ViewProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(
    ViewProfileData viewProfileData,
  ) async =>
      profileRepository.viewProfile(viewProfileData.token);
}

class ViewProfileData extends Equatable {
  final String token;

  const ViewProfileData({
    required this.token,
  });

  @override
  List<Object?> get props => [
        token,
      ];
}
