import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/model/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profilerepository;
  ProfileBloc(this.profilerepository) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        final profileData = await profilerepository.getProfile();
        emit(ProfileSuccess(profile: profileData));
      } catch (e) {
        emit(ProfileFauilure(error: e.toString()));
      }
    });
  }
}
