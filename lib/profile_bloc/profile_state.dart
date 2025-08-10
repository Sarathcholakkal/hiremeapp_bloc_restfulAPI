part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileSucessState extends ProfileState {
  final List<Profile> profile;

  ProfileSucessState({required this.profile});
}

final class ProfileFauilureState extends ProfileState {
  final String error;

  ProfileFauilureState({required this.error});
}

final class ProfileEmptyState extends ProfileState {}
