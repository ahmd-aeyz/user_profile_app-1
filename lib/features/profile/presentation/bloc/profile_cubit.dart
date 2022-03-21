import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:final_project/features/profile/domain/usecases/edit_profile.dart';
import 'package:final_project/features/profile/domain/usecases/view_profile.dart';
import 'package:final_project/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required this.viewUseCase,
    required this.editUseCase,
  }) : super(const ProfileInitial());
  ViewProfile viewUseCase;
  EditProfile editUseCase;

  Future<void> viewProfile({
    required String token,
  }) async {
    emit(const ProfileLoading());
    final result = await viewUseCase(ViewProfileData(token: token));
    emit(
      result.fold(
        (error) => ProfileErrorDetails(error.toString()),
        (profile) => ProfileSuccess(profile),
      ),
    );
  }

  Future<void> editProfile({
    required String token,
    required Profile profile,
  }) async {
    emit(const ProfileState.loading());
    final result = await editUseCase(
      EditProfileData(
        token: token,
        profile: profile,
      ),
    );
    result.fold(
      (error) => emit(ProfileErrorDetails(error.toString())),
      (profile) => emit(ProfileSuccess(profile)),
    );
  }
}
