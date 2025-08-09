import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/model/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profilerepository;
  ProfileBloc(this.profilerepository) : super(ProfileInitialState()) {
    on<ProfileFetchEvent>((event, emit) async {
      emit(ProfileLoadingState());

      try {
        print('try started to executes');
        final profileData = await profilerepository.getProfile();
        log(profileData.toString());
        emit(ProfileSucessState(profile: profileData));
      } catch (e) {
        emit(ProfileFauilureState(error: e.toString()));
        // emit(ProfileEmpty());
      }
    });
    on<ProfilePutEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        await profilerepository.updateData(event.userprofile);
        emit(
          ProfileSucessState(profile: event.userprofile),
        ); // You can customize this
      } catch (e) {
        emit(ProfileFauilureState(error: e.toString()));
      }
    });
    //==============
    on<ProfileDeleteEvent>((event, emit) async {
      try {
        await profilerepository.deleteData(event.id);
        emit(
          ProfileEmptyState(),
        ); // Or a ProfileDeleted state, if you want to show confirmation
      } catch (e) {
        emit(ProfileFauilureState(error: e.toString()));
      }
    });
    //====================
    on<ProfilePostEvent>((event, emit) async {
      emit(ProfileLoadingState());
      try {
        await profilerepository.insertData(event.usreprofile);

        // emit(
        //   ProfileSuccess(profile: event.usreprofile),
        // ); // You can customize this
      } catch (e) {
        // emit(ProfileFauilure(error: e.toString()));
      }
    });
  }
}




  // post(userprofile: event.userprofile);