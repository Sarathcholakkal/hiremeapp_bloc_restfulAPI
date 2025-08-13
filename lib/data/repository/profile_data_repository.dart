import 'dart:developer';

import 'package:hireme_app/data/data_provider/profile_data_provider.dart';

import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/utils/shared_pref_helper.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  final ProfileDataProvider profileDataProvider;

  ProfileRepository(this.profileDataProvider);

  Future<List<Profile>> getProfiles() async {
    List<String> listofKeys = await SharedPrefHelper().getStringList();
    List<Profile> profiles =[ ];

    for (String key in listofKeys) {
      try {
        final rawProfileData = await profileDataProvider.gerProfielData(key);
        Profile singleProfile = profileFromJson(rawProfileData);
        profiles.add(singleProfile);
      } catch (e) {
        continue;
      }
    }
    return profiles;
  }

  Future<void> postData(Profile userprofile) async {
    final response = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: {"Content-Type": "application/json"},
      body: profileToJson(userprofile),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to insert profile data");
    }
    log(response.body.toString());

    final data = profileFromJson(response.body);
    final prefs = SharedPrefHelper();
    await prefs.addStringToList(data.id!);
  }

  //..................

  Future<void> putData(Profile userprofile) async {
    final response = await http.put(
      Uri.parse("https://api.restful-api.dev/objects/${userprofile.id}"),
      headers: {"Content-Type": "application/json"},
      body: profileToJson(userprofile),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Failed to insert profile data");
    }
  }

  Future<void> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse("https://api.restful-api.dev/objects/$id"),
      headers: {"Content-Type": "application/json"},
    );

    log(' after delte status code${response.statusCode}');
    final prefs = SharedPrefHelper();
    await prefs.removeStringFromList(id);
  }
}
