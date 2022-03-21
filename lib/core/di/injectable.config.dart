// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/datasources/auth_service.dart' as _i5;
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i4;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i3;
import '../../features/auth/domain/usecases/login.dart' as _i7;
import '../../features/auth/domain/usecases/register.dart' as _i11;
import '../../features/auth/presentation/bloc/auth_cubit.dart' as _i13;
import '../../features/profile/data/datasources/profile_service.dart' as _i10;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i9;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i8;
import '../../features/profile/domain/usecases/edit_profile.dart' as _i14;
import '../../features/profile/domain/usecases/view_profile.dart' as _i12;
import '../../features/profile/presentation/bloc/profile_cubit.dart' as _i15;
import 'app_dio.dart' as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appDio = _$AppDio();
  gh.factory<_i3.AuthRepository>(
      () => _i4.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.factory<_i6.Dio>(() => appDio.getDio);
  gh.factory<_i7.Login>(() => _i7.Login(get<_i3.AuthRepository>()));
  gh.factory<_i8.ProfileRepository>(
      () => _i9.ProfileRepositoryImpl(get<_i10.ProfileService>()));
  gh.factory<_i11.Register>(() => _i11.Register(get<_i4.AuthRepositoryImpl>()));
  gh.factory<_i12.ViewProfile>(
      () => _i12.ViewProfile(get<_i8.ProfileRepository>()));
  gh.factory<_i13.AuthCubit>(() => _i13.AuthCubit(
      registerUseCase: get<_i11.Register>(), loginUseCase: get<_i7.Login>()));
  gh.factory<_i14.EditProfile>(
      () => _i14.EditProfile(get<_i8.ProfileRepository>()));
  gh.factory<_i15.ProfileCubit>(() => _i15.ProfileCubit(
      viewUseCase: get<_i12.ViewProfile>(),
      editUseCase: get<_i14.EditProfile>()));
  return get;
}

class _$AppDio extends _i16.AppDio {}
