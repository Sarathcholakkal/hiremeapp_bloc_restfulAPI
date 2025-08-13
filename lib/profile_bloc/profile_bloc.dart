import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/model/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profilerepository;
  ProfileBloc(this.profilerepository) : super(ProfileInitialState()) {
    on<ProfileFetchEvent>(_onFetchProfile);
    on<ProfilePostEvent>(_onPostProfile);
    on<ProfilePutEvent>(_onPutProfile);
    on<ProfileDeleteEvent>(_onDeleteProfile);
  }

  //..................on fetch data
  Future<void> _onFetchProfile(
    ProfileFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    try {
      final profilesData = await profilerepository.getProfiles();
      emit(ProfileSucessState(profile: profilesData));
    } catch (e) {
      emit(ProfileFauilureState(error: e.toString()));
    }
  }
  //.............on post data

  Future<void> _onPostProfile(
    ProfilePostEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      await profilerepository.postData(event.usreprofile);
      final updatedData = await profilerepository.getProfiles();
      emit(ProfileSucessState(profile: updatedData));
    } catch (e) {
      emit(ProfileFauilureState(error: e.toString()));
    }
  }

  //---------------on put data
  Future<void> _onPutProfile(
    ProfilePutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      await profilerepository.putData(event.userprofile);
      final updatedData = await profilerepository.getProfiles();
      emit(ProfileSucessState(profile: updatedData));
    } catch (e) {
      emit(ProfileFauilureState(error: e.toString()));
    }
  }

  //----------------delete event
  Future<void> _onDeleteProfile(
    ProfileDeleteEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());
    try {
      await profilerepository.deleteData(event.id);
      final updatedData = await profilerepository.getProfiles();
      emit(ProfileSucessState(profile: updatedData));
    } catch (e) {
      emit(ProfileFauilureState(error: e.toString()));
    }
  }
}
