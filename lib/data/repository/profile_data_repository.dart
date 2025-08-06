import 'package:hireme_app/data/data_provider/profile_data_provider.dart';

import 'package:hireme_app/model/model.dart';
// Your Profile and Data classes

class ProfileRepository {
  final ProfileDataProvider profileDataProvider;

  ProfileRepository(this.profileDataProvider);

  Future<Profile> getProfile() async {
    try {
      final rawProfileData = await profileDataProvider.getProfileData();

      final formmodeldata = Profile.fromJson(rawProfileData);

      print("data form :profile:$formmodeldata");

      return Profile.fromJson(rawProfileData);
    } catch (e) {
      throw 'Failed to fetch profile: $e';
    }
  }
}
