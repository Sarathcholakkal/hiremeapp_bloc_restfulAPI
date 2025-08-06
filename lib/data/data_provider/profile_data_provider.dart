//all Crud opeartion of data here: fectch ,post ,delete

import 'dart:convert';

import 'package:http/http.dart' as http;

// class ProfileDataProvider {
//   Future<String> getProfileData() async {
//     try {
//       final response = await http.get(
//         // Uri.parse("https://api.restful-api.dev/objects"),
//         Uri.parse(
//           "https://api.restful-api.dev/objects/ff8081819782e69e01987b57b49e4533",
//         ),
//       );
//       print(response.body.toString());

//       final data = jsonDecode(response.body);

//       if (data['cod'] != '200') {
//         throw 'An unexpected error occurred';
//       }

//       return response.body;
//     } catch (e) {
//       throw e.toString();
//     }
//   }
// }

class ProfileDataProvider {
  Future<Map<String, dynamic>> getProfileData() async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.restful-api.dev/objects/ff8081819782e69e01987b57b49e4533",
        ),
      );

      // Print raw response for debugging
      print("the body data:${response.body}");

      // Check HTTP status code
      if (response.statusCode != 200) {
        throw 'Failed to load profile data. Status code: ${response.statusCode}';
      }

      // Decode the JSON response
      final data = jsonDecode(response.body);
      print("the encoded json data:$data");

      return data;
    } catch (e) {
      throw 'Error fetching profile data: $e';
    }
  }
}
