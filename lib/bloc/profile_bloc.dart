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
    on<ProfileFetchEvent>(_onFetchProfile);
    on<ProfilePostEvent>(_onPostProfile);
    on<ProfilePutEvent>(_onPutProfile);
  }

  //..................on fetch data
  Future<void> _onFetchProfile(
    ProfileFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    try {
      final profileData = await profilerepository.getProfile();
      emit(ProfileSucessState(profile: profileData));
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
      final updatedData = await profilerepository.getProfile();
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
      final updatedData = await profilerepository.getProfile();
      emit(ProfileSucessState(profile: updatedData));
    } catch (e) {
      emit(ProfileFauilureState(error: e.toString()));
    }
  }
}




  // post(userprofile: event.userprofile)



    //   on<ProfilePutEvent>((event, emit) async {
    //   emit(ProfileLoadingState());
    //   try {
    //     await profilerepository.updateData(event.userprofile);
    //     emit(
    //       ProfileSucessState(profile: event.userprofile),
    //     ); // You can customize this
    //   } catch (e) {
    //     emit(ProfileFauilureState(error: e.toString()));
    //   }
    // });
    // //==============
    // on<ProfileDeleteEvent>((event, emit) async {
    //   try {
    //     await profilerepository.deleteData(event.id);
    //     emit(
    //       ProfileEmptyState(),
    //     ); // Or a ProfileDeleted state, if you want to show confirmation
    //   } catch (e) {
    //     emit(ProfileFauilureState(error: e.toString()));
    //   }
    // });
    // //====================
    // on<ProfilePostEvent>((event, emit) async {
    //   emit(ProfileLoadingState());
    //   try {
    //     await profilerepository.insertData(event.usreprofile);

    //     // emit(
    //     //   ProfileSuccess(profile: event.usreprofile),
    //     // ); // You can customize this
    //   } catch (e) {
    //     // emit(ProfileFauilure(error: e.toString()));
    //   }
    // });
