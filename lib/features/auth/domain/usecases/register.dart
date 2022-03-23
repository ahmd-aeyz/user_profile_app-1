import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/data/model/user_model.dart';
import 'package:final_project/core/domain/error/failure.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class Register implements UseCase<Token, RegisterData> {
  AuthRepository authRepository;
  Register(this.authRepository);

  @override
  Future<Either<Failure, Token>> call(RegisterData registerData) async =>
      authRepository.register(
        email: registerData.email,
        name: registerData.name,
        phone: registerData.phone,
        password: registerData.password,
      );
}

class RegisterData extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;

  const RegisterData({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        phone,
      ];
}
