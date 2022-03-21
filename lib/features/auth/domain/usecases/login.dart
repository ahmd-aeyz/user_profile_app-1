import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/entities/user.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login extends UseCase<User, LoginData> {
  AuthRepository authRepository;
  Login(this.authRepository);
  @override
  Future<Either<Failure, User>> call(LoginData loginData) async =>
      authRepository.login(
        email: loginData.email,
        password: loginData.password,
      );
}

class LoginData extends Equatable {
  final String email;
  final String password;

  const LoginData({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
