import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/usecases/login.dart';
import 'package:final_project/features/auth/domain/usecases/logout.dart';
import 'package:final_project/features/auth/domain/usecases/register.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._registerUserCase,
    this._loginUseCase,
    this._logout,
  ) : super(const AuthInitial());
  final Register _registerUserCase;
  final Login _loginUseCase;
  final Logout _logout;

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(const AuthLoading());
    final result = await _registerUserCase(
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
    final result = await _loginUseCase(
      LoginData(
        email: email,
        password: password,
      ),
    );
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (user) {
          return const AuthSuccess();
        },
      ),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logout(NoParams());
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (_) {
          return const AuthSuccess();
        },
      ),
    );
  }
}
