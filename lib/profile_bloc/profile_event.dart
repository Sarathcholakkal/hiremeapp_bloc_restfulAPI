part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileFetchEvent extends ProfileEvent {
  // final String userId;

  // ProfileFetched({required this.userId});
}

final class ProfilePostEvent extends ProfileEvent {
  final Profile usreprofile;

  ProfilePostEvent({required this.usreprofile});
}

final class ProfilePutEvent extends ProfileEvent {
  final Profile userprofile;

  ProfilePutEvent({required this.userprofile});
}

final class ProfileDeleteEvent extends ProfileEvent {
  final String id;

  ProfileDeleteEvent({required this.id});
}
