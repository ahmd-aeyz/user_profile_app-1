import 'package:dartz/dartz.dart';
import 'package:final_project/core/data/models/user_mapper.dart';
import 'package:final_project/core/domain/datasources/local_datasource.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/auth/data/datasources/auth_service.dart';
import 'package:final_project/features/auth/data/models/login_mapper.dart';
import 'package:final_project/features/auth/domain/entities/login_entity.dart';
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
  Future<Either<Failure, Unit>> register({
    required User user,
  }) async {
    try {
      final token = await authService.register(userModel: user.toModel());
      localDataSource.saveToken(token.token);
      return right(unit);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> login({
    required LoginEntity loginEntity,
  }) async {
    try {
      final token = await authService.login(
        loginModel: loginEntity.toModel(),
      );
      localDataSource.saveToken(token.token);
      return right(unit);
    } catch (error) {
      return left(Failure(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      localDataSource.deleteToken();
      return right(unit);
    } catch (error) {
      return left(Failure(error));
    }
  }
}
