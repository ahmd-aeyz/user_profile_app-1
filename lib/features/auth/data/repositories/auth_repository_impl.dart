import 'package:dartz/dartz.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/features/auth/data/datasources/auth_service.dart';
import 'package:final_project/features/auth/domain/entities/user.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthService authService;
  AuthRepositoryImpl(this.authService);

  @override
  Future<Either<Failure, User>> register() async {
    try {
      final user = await authService.register();
      return right(user as User);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authService.login(
        email: email,
        password: password,
      );
      return right(user as User);
    } catch (error) {
      return left(Failure(error));
    }
  }
}
