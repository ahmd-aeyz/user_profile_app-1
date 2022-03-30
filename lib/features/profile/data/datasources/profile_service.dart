import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/core/data/models/user_model.dart';
import 'package:final_project/features/profile/data/models/image_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'profile_service.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileService {
  @factoryMethod
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('user')
  Future<UserModel> viewProfile({
    @Header('Authorization') required String token,
  });

  @POST('edit_user')
  Future<UserModel> editProfile({
    @Header('Authorization') required String token,
    @Body() required UserModel userModel,
  });

  @POST('https://api.imgbb.com/1/upload')
  @MultiPart()
  Future<ImageModel> updateImage({
    @Part() @Query('key') String key = 'ad54db45a510342fbfef1568797bf4fd',
    @Part(name: 'image') required File image,
  });
}
