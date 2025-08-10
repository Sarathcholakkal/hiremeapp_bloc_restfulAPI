import 'dart:convert';
import 'dart:developer';
import 'dart:math' show Random;
import 'dart:ui';
import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/utils/shared_pref_helper.dart';
import 'package:http/http.dart' as http;

final class HelperFunctions {
  static Color generateLightRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(36) + 220,
      random.nextInt(36) + 220,
      random.nextInt(36) + 220,
    );
  }

  static Future<void> insertData() async {
    final response = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": "vinode ",
        "data": {
          "profession": "data sceintist",
          "Profile Description":
              "im eager to learinging everything from past two year i no able to divdied anything yet",
          "Qualification": "MCA",
          "Experience": "1 year",
        },
      }),
    );
    log(response.body.toString());

    final data = profileFromJson(response.body);
    final prefs = SharedPrefHelper();
    await prefs.putString(data.id!);
    final newkey = await prefs.getString();
  }
}
