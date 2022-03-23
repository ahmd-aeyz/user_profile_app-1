import 'dart:io';
import 'package:dio/dio.dart';
import 'package:final_project/features/profile/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'profile_service.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileService {
  @factoryMethod
  factory ProfileService(Dio dio) = _ProfileService;

  @GET('user')
  Future<ProfileModel> viewProfile({
    @Header('Authorization') required String token,
  });

  @POST('edit_user')
  @MultiPart()
  Future<ProfileModel> editProfile({
    @Header('Authorization') required String token,
    @Body() required ProfileData profileData,
  }
      // @Part() @Query('name') required String name,
      // @Part() @Query('email') required String email,
      // @Part() @Query('password') required String password,
      // @Part() @Query('phone') required String phone,
      // @Part() @Query('address') String? address,
      // @Part() @Query('age') int? age,
      // @Part(name: 'image') File? imageFile,
      );

  @POST('https://api.imgbb.com/1/upload')
  @MultiPart()
  Future<String> updateImage({
    @Part() @Query('key') String key = 'ad54db45a510342fbfef1568797bf4fd',
    @Part(name: 'image') required File image,
  });
}
