part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileFetched extends ProfileEvent {
  // final String userId;

  // ProfileFetched({required this.userId});
}

final class ProfilePostEvent extends ProfileEvent {
  final Profile userprofile;

  ProfilePostEvent({required this.userprofile});
}

final class ProfileDeleteEvent extends ProfileEvent {
  final String id;

  ProfileDeleteEvent({required this.id});
}
