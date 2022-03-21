import 'package:final_project/features/profile/domain/entities/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.success(final Profile profile) = ProfileSuccess;
  const factory ProfileState.error(final String error) = ProfileErrorDetails;
}
