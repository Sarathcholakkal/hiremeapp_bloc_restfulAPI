import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hireme_app/data/data_provider/profile_data_provider.dart';
import 'package:hireme_app/data/repository/profile_data_repository.dart';
import 'package:hireme_app/presentations/screens/home_screen.dart';
import 'package:hireme_app/utils/screen_size.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      // insertData();
      // getProfileData();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      // apicall();
    });
    super.initState();
  }

  void apicall() async {
    final dataformdataprovider = await ProfileDataProvider().gerProfielData();
    print("the received data is at apicall funciton: $dataformdataprovider");
    final repodata = await ProfileRepository(
      ProfileDataProvider(),
    ).getProfile();

    print("the profile data:$repodata");
    print(repodata.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig.init(context); // initialize once
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/hireme_logo.png',
        width: SizeConfig.screenWidth * 0.1389,
        height: SizeConfig.screenHeight * 0.0825,
        fit: BoxFit.cover,
      ),
    );
  }

  Future<void> insertData() async {
    final response = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": "sarath ",
        "data": {
          "profession": "data sceintist",
          "Profile Description":
              "im eager to learinging everything from past two year i no able to divdied anything yet",
          "Qualification": "MCA",
          "Experience": "1 year",
        },
      }),
    );
    print(response.body.toString());
  }

  Future<String> getProfileData() async {
    try {
      final response = await http.get(
        // Uri.parse("https://api.restful-api.dev/objects"),
        Uri.parse(
          "https://api.restful-api.dev/objects/ff8081819782e69e01987b6619f7454a",
        ),
      );
      print(response.body.toString());

      final data = jsonDecode(response.body);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
