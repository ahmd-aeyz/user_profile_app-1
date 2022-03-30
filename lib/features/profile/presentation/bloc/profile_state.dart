import 'package:final_project/core/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.success(final User user) = ProfileSuccess;
  const factory ProfileState.error(final String error) = ProfileErrorDetails;
}
