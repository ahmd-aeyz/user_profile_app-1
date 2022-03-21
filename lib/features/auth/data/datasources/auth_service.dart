import 'package:dio/dio.dart';
import 'package:final_project/features/auth/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @POST('register')
  Future<UserModel> register();

  @POST('login')
  Future<UserModel> login({
    @Query('email') required String email,
    @Query('password') required String password,
  });
}
