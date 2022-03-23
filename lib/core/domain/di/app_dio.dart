import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDio {
  Dio get getDio => Dio(
        BaseOptions(
          baseUrl: 'https://api-sanctum-package.herokuapp.com/api/',
          receiveDataWhenStatusError: true,
        ),
      );
}
