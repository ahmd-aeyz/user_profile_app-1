import 'dart:io';
import 'package:final_project/core/domain/usecases/usecase.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';
import 'package:final_project/features/profile/domain/usecases/view_profile.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._viewUserCase,
    this._editUseCase,
  ) : super(const ProfileInitial());
  final ViewProfile _viewUserCase;
  final EditProfile _editUseCase;

  Future<void> viewProfile() async {
    emit(const ProfileLoading());
    final result = await _viewUserCase(NoParams());
    emit(
      result.fold(
        (error) => ProfileErrorDetails(error.toString()),
        (user) => ProfileSuccess(user),
      ),
    );
  }

  Future<void> editProfile({
    required String name,
    required String email,
    required String password,
    required String phone,
    File? imageFile,
    String? address,
    int? age,
  }) async {
    emit(const ProfileState.loading());
    final result = await _editUseCase(
      EditProfileData(
        name: name,
        email: email,
        password: password,
        phone: phone,
        imageFile: imageFile,
        address: address,
        age: age,
      ),
    );
    result.fold(
      (error) => emit(ProfileErrorDetails(error.toString())),
      (profile) => emit(ProfileSuccess(profile)),
    );
  }
}
