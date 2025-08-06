part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final Profile profile;

  ProfileSuccess({required this.profile});
}

final class ProfileFauilure extends ProfileState {
  final String error;

  ProfileFauilure({required this.error});
}

final class ProfileLoading extends ProfileState {}

final class ProfileEmpty extends ProfileState {}
