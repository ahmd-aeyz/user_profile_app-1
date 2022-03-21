import 'package:final_project/features/auth/domain/usecases/login.dart';
import 'package:final_project/features/auth/domain/usecases/register.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUseCase,
    required this.loginUseCase,
  }) : super(const AuthInitial());
  Register registerUseCase;
  Login loginUseCase;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(const AuthLoading());
    final result = await registerUseCase(
      RegisterData(
        name: name,
        email: email,
        password: password,
        phone: phone,
      ),
    );
    emit(
      result.fold(
        (error) => AuthErrorDetails(error.toString()),
        (user) {
          // save token
          return const AuthSuccess();
        },
      ),
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading());
    final result = await loginUseCase(
      LoginData(
        email: email,
        password: password,
      ),
    );
    emit(
      result.fold(
        (error) => AuthErrorDetails(error.toString()),
        (user) {
          // save token
          return const AuthSuccess();
        },
      ),
    );
  }
}
