import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/model/model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profilerepository;
  ProfileBloc(this.profilerepository) : super(ProfileInitial()) {
    on<ProfileFetched>((event, emit) async {
      emit(ProfileLoading());

      try {
        print('try started to executes');
        final profileData = await profilerepository.getProfile();
        log(profileData.toString());
        emit(ProfileSuccess(profile: profileData));
      } catch (e) {
        emit(ProfileFauilure(error: e.toString()));
      }
    });
    on<ProfilePostEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        await profilerepository.updateData(event.userprofile);
        emit(
          ProfileSuccess(profile: event.userprofile),
        ); // You can customize this
      } catch (e) {
        emit(ProfileFauilure(error: e.toString()));
      }
    });
    //==============
    on<ProfileDeleteEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        await profilerepository.deleteData(event.id);
        emit(
          ProfileInitial(),
        ); // Or a ProfileDeleted state, if you want to show confirmation
      } catch (e) {
        emit(ProfileFauilure(error: e.toString()));
      }
    });
  }
}

post({required Profile userprofile}) {}



  // post(userprofile: event.userprofile);