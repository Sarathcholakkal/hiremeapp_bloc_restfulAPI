import 'package:hireme_app/utils/shared_pref_helper.dart';
import 'package:http/http.dart' as http;

class ProfileDataProvider {
  Future<String> gerProfielData(String key) async {
    try {
      final response = await http.get(
        Uri.parse("https://api.restful-api.dev/objects/$key"),
      );

      if (response.statusCode != 200) {
        throw 'Failed to load profile data. Status code: ${response.statusCode}';
      }

      return response.body;
    } catch (e) {
      throw 'Error fetching profile data: $e';
    }
  }
}

//ff8081819782e69e01987fdddc945d8f
