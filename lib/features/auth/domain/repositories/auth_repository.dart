import 'package:dartz/dartz.dart';
import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/features/auth/domain/entities/login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> register({required User user});

  Future<Either<Failure, Unit>> login({required LoginEntity loginEntity});

  Future<Either<Failure, Unit>> logout();
}
