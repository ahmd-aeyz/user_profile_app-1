import 'package:dartz/dartz.dart';
import 'package:final_project/core/data/model/user_model.dart';
import 'package:final_project/core/domain/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> register({
    required String email,
    required String name,
    required String password,
    required String phone,
  });
  Future<Either<Failure, Token>> login({
    required String email,
    required String password,
  });
}
