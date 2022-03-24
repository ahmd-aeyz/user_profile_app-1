// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../../features/auth/data/datasources/auth_service.dart' as _i6;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i13;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i12;
import '../../../features/auth/domain/usecases/login.dart' as _i15;
import '../../../features/auth/domain/usecases/logout.dart' as _i16;
import '../../../features/auth/domain/usecases/register.dart' as _i18;
import '../../../features/auth/presentation/bloc/auth_cubit.dart' as _i19;
import '../../../features/profile/data/datasources/profile_service.dart' as _i4;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i10;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i9;
import '../../../features/profile/domain/usecases/edit_profile.dart' as _i14;
import '../../../features/profile/domain/usecases/view_profile.dart' as _i11;
import '../../../features/profile/presentation/bloc/profile_cubit.dart' as _i17;
import '../../data/datasources/local_datasource_impl.dart' as _i8;
import '../datasources/local_datasource.dart' as _i7;
import 'app_dio.dart' as _i20;
import 'shared_pref.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appDio = _$AppDio();
  final cacheHelper = _$CacheHelper();
  gh.factory<_i3.Dio>(() => appDio.getDio);
  gh.lazySingleton<_i4.ProfileService>(
      () => _i4.ProfileService(get<_i3.Dio>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => cacheHelper.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i6.AuthService>(() => _i6.AuthService(get<_i3.Dio>()));
  gh.factory<_i7.LocalDataSource>(
      () => _i8.LocalDataSourceImpl(get<_i5.SharedPreferences>()));
  gh.factory<_i9.ProfileRepository>(() => _i10.ProfileRepositoryImpl(
      profileService: get<_i4.ProfileService>(),
      localDataSource: get<_i7.LocalDataSource>()));
  gh.factory<_i11.ViewProfile>(
      () => _i11.ViewProfile(get<_i9.ProfileRepository>()));
  gh.factory<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
      authService: get<_i6.AuthService>(),
      localDataSource: get<_i7.LocalDataSource>()));
  gh.factory<_i14.EditProfile>(
      () => _i14.EditProfile(get<_i9.ProfileRepository>()));
  gh.factory<_i15.Login>(() => _i15.Login(get<_i12.AuthRepository>()));
  gh.factory<_i16.Logout>(() => _i16.Logout(get<_i12.AuthRepository>()));
  gh.factory<_i17.ProfileCubit>(() =>
      _i17.ProfileCubit(get<_i11.ViewProfile>(), get<_i14.EditProfile>()));
  gh.factory<_i18.Register>(() => _i18.Register(get<_i12.AuthRepository>()));
  gh.factory<_i19.AuthCubit>(() => _i19.AuthCubit(
      get<_i18.Register>(), get<_i15.Login>(), get<_i16.Logout>()));
  return get;
}

class _$AppDio extends _i20.AppDio {}

class _$CacheHelper extends _i21.CacheHelper {}
