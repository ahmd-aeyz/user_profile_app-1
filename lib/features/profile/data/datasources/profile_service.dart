import 'package:dio/dio.dart';
import 'package:final_project/features/profile/data/models/profile_model.dart';
import 'package:retrofit/retrofit.dart';
part 'profile_service.g.dart';

@RestApi(baseUrl: '')
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('profile')
  Future<ProfileModel> viewProfile(@Query('token') String token);

  @POST('profile')
  Future<ProfileModel> editProfile({
    @Query('token') required String token,
    @Query('profile') required ProfileModel profile,
  });
}
