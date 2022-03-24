import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Logout implements UseCase<void, NoParams> {
  AuthRepository authRepository;
  Logout(this.authRepository);
  @override
  Future<Either<Failure, void>> call(NoParams noParams) async =>
      authRepository.logout();
}
