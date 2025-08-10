import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/presentations/screens/update_entry.dart';
import 'package:hireme_app/profile_bloc/profile_bloc.dart';
import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/utils/const.dart';
import 'package:hireme_app/utils/screen_size.dart';
import 'dart:developer' as check;

class CustomCard extends StatelessWidget {
  final Profile profileData;
  const CustomCard({super.key, required this.profileData});

  Color _generateLightRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(76) + 180,
      random.nextInt(76) + 180,
      random.nextInt(76) + 180,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: _generateLightRandomColor(),
      elevation: 30,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: SizeConfig.screenHeight * .33,
        width: SizeConfig.screenWidth * .75,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  profileData.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    letterSpacing: 1.5,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx1) {
                        return AlertDialog(
                          title: const Text(
                            'Are you sure you want to delete this profile?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx1).pop();
                              },
                              child: const Text('Close'),
                            ),
                            TextButton(
                              onPressed: () {
                                check.log(profileData.id!);
                                context.read<ProfileBloc>().add(
                                  ProfileDeleteEvent(id: profileData.id!),
                                );
                                Navigator.of(ctx1).pop(); // Close the dialog
                              },
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),

            Text(
              profileData.data.profession,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4),
              width: double.infinity,
              height: SizeConfig.screenHeight * .12,
              // color: Colors.red,
              child: AutoSizeText(
                profileData.data.profileDescription,
                maxLines: 4,
                minFontSize: 14,
                maxFontSize: 18,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 5,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Educational Qualification :',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: profileData.data.qualification,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Experince :',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          children: [
                            TextSpan(
                              text: profileData.data.experience,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: textButtonColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    minimumSize: Size(0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // edit data despantyh
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdateEntry(userprofile: profileData),
                      ),
                    );
                  },
                  child: const Text("Edit", style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
