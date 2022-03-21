import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/core/error/failure.dart';
import 'package:final_project/core/usecases/usecase.dart';
import 'package:final_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:final_project/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class Register extends UseCase<User, RegisterData> {
  AuthRepositoryImpl authRepository;
  Register(this.authRepository);

  @override
  Future<Either<Failure, User>> call(RegisterData registerData) async =>
      authRepository.register();
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
