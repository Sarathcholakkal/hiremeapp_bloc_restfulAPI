import 'package:hireme_app/data/data_provider/profile_data_provider.dart';

import 'package:hireme_app/model/model.dart';
import 'package:http/http.dart' as http;
// Your Profile and Data classes

class ProfileRepository {
  final ProfileDataProvider profileDataProvider;

  ProfileRepository(this.profileDataProvider);

  Future<Profile> getProfile() async {
    try {
      final rawProfileData = await profileDataProvider.gerProfielData();
      return profileFromJson(rawProfileData);
    } catch (e) {
      throw 'Failed to fetch profile: $e';
    }
  }

  Future<void> updateData(Profile userprofile) async {
    final response = await http.put(
      Uri.parse("https://api.restful-api.dev/objects/${userprofile.id}"),
      headers: {"Content-Type": "application/json"},
      body: profileToJson(userprofile),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to insert profile data");
    }
  }
}
