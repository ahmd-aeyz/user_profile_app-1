import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/repositories/profile_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ViewProfile implements UseCase<User, NoParams> {
  ProfileRepository profileRepository;
  ViewProfile(this.profileRepository);

  @override
  Future<Either<Failure, User>> call(
    NoParams noParams,
  ) async =>
      profileRepository.viewProfile();
}
