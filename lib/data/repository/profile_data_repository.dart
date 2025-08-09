import 'dart:convert';
import 'dart:developer';

import 'package:hireme_app/data/data_provider/profile_data_provider.dart';

import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/utils/shared_pref_helper.dart';
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
    await prefs.putString(data.id!);
    final newkey = await prefs.getString();
    log('this nehal key:$newkey');
  }

  //..................

  //   Future<void> postData(Profile userprofile) async {
  //     final response = await http.post(
  //       Uri.parse("https://api.restful-api.dev/objects"),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "name": "nehala ",
  //         "data": {
  //           "profession": "machine learing",
  //           "Profile Description":
  //               "we are machine learners  learinging everything from past two year i no able to divdied anything yet",
  //           "Qualification": "Hello",
  //           "Experience": "3 year",
  //         },
  //       }),
  //     );
  //     log(response.body.toString());

  //     final data = profileFromJson(response.body);
  //     final prefs = SharedPrefHelper();
  //     await prefs.putString(data.id!);
  //     final newkey = await prefs.getString();
  //     log('this nehal key:$newkey');
  //   }
  // }

  // profile_repository.dart
  Future<void> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse("https://api.restful-api.dev/objects/$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete profile');
    }
  }
}




  // final response = await http.put(
  //     Uri.parse("https://api.restful-api.dev/objects/${userprofile.id}"),
  //     headers: {"Content-Type": "application/json"},
  //     body: profileToJson(userprofile),
  //   );

  //   if (response.statusCode != 200 && response.statusCode != 201) {
  //     throw Exception("Failed to insert profile data");
  //   }
