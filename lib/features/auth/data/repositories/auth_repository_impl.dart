import 'package:dartz/dartz.dart';
import 'package:final_project/core/data/model/user_model.dart';
import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/auth/data/datasources/auth_service.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  LocalDataSource localDataSource;
  AuthRepositoryImpl({
    required this.authService,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Token>> register({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) async {
    try {
      final token = await authService.register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: password,
        phone: phone,
      );
      localDataSource.saveToken(token.accessToken);
      return right(token);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Token>> login({
    required String email,
    required String password,
  }) async {
    try {
      final token = await authService.login(
        email: email,
        password: password,
      );
      localDataSource.saveToken(token.accessToken);
      return right(token);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      localDataSource.deleteToken();
      return right(null);
    } catch (error) {
      return left(Failure(error));
    }
  }
}
