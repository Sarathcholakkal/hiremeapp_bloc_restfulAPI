part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileFetched extends ProfileEvent {
  // final String userId;

  // ProfileFetched({required this.userId});
}
