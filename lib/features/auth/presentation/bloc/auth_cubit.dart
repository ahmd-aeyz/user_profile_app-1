import 'package:final_project/core/domain/entities/user.dart';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/auth/domain/entities/login_entity.dart';
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

  Future<void> register({required User user}) async {
    emit(const AuthLoading());
    final result = await _registerUserCase(
      RegisterData(
        user: user,
      ),
    );
    emit(
      result.fold(
        (error) => AuthErrorDetails(error.toString()),
        (_) => const AuthSuccess(),
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
        loginEntity: LoginEntity(
          email: email,
          password: password,
        ),
      ),
    );
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (_) => const AuthSuccess(),
      ),
    );
  }

  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _logout(NoParams());
    emit(
      result.fold(
        (error) => const AuthErrorDetails('Network error'),
        (_) => const AuthSuccess(),
      ),
    );
  }
}
