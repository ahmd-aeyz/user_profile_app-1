import 'dart:io';
import 'package:final_project/core/domain/entities/user.dart';
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
    required User user,
    File? imageFile,
  }) async {
    emit(const ProfileState.loading());
    final result = await _editUseCase(
      EditProfileData(
        user: user,
        imageFile: imageFile,
      ),
    );
    result.fold(
      (error) => emit(ProfileErrorDetails(error.toString())),
      (user) => emit(ProfileSuccess(user)),
    );
  }
}
