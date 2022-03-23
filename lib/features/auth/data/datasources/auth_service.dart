import 'package:dio/dio.dart';
import 'package:final_project/core/data/model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_service.g.dart';

@lazySingleton
@RestApi()
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  @POST('register')
  Future<Token> register({
    @Query('name') required String name,
    @Query('email') required String email,
    @Query('password') required String password,
    @Query('password_confirmation') required String passwordConfirmation,
    @Query('phone') required String phone,
  });

  @POST('login')
  Future<Token> login({
    @Query('email') required String email,
    @Query('password') required String password,
  });
}
