import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/bloc/profile_bloc.dart';
import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/presentations/widgets/text_field_title.dart';
import 'package:hireme_app/utils/const.dart';
import 'package:hireme_app/utils/text_validator.dart';

class AddNewEntry extends StatefulWidget {
  const AddNewEntry({super.key});

  @override
  State<AddNewEntry> createState() => _AddNewEntryState();
}

class _AddNewEntryState extends State<AddNewEntry> {
  final _nameContorller = TextEditingController();
  final _professionController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _experienceController = TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey();

  // ! help to clear text field

  void clearField() {
    _nameContorller.clear();

    _qualificationController.clear();

    _professionController.clear();
  }
  // ! onsubmitted fun for create instace of student using  input field

  Future<void> onSubmit(BuildContext ctx) async {
    print('one submitte pressed');
    final name = _nameContorller.text.trim();
    final profession = _professionController.text.trim();
    final descriptions = _descriptionController.text.trim();
    final qulification = _qualificationController.text.trim();
    final experinece = _experienceController.text.trim();

    final userprofile = Profile(
      name: name,
      data: Data(
        profession: profession,
        profileDescription: descriptions,
        qualification: qulification,
        experience: experinece,
      ),
    );

    // context.read<ProfileBloc>().add(ProfilePostEvent(usreprofile: userprofile));

    log('profile created');
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    context.read<ProfileBloc>().add(ProfileFetchEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Entry",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Form(
                    key: _signInKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          TextFieldTitle(title: "Name"),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            controller: _nameContorller,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Name',
                            ),
                            validator: TextValidator(fieldName: 'Name').call,
                          ),

                          TextFieldTitle(title: "Profession"),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            controller: _professionController,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Profession',
                            ),
                            validator: TextValidator(
                              fieldName: 'profession',
                            ).call,
                          ),
                          TextFieldTitle(title: "Profile Desctiption"),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            controller: _descriptionController,
                            minLines: 4,
                            maxLines: 5,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Profession',
                            ),
                            validator: TextValidator(
                              fieldName: 'profession',
                            ).call,
                          ),

                          TextFieldTitle(title: "Qualifications"),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            controller: _qualificationController,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Educational Qualification',
                            ),
                            validator: TextValidator(
                              fieldName: 'Qualification',
                            ).call,
                          ),
                          TextFieldTitle(title: "Experience"),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.text,
                            controller: _experienceController,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Experience in Year',
                            ),
                            validator: TextValidator(
                              fieldName: 'experience',
                            ).call,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,

                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: textButtonColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 5,
                                ),
                                minimumSize: Size(0, 0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                if (_signInKey.currentState!.validate()) {
                                  debugPrint('form validated');
                                  onSubmit(context);
                                } else {
                                  debugPrint("form not validated");
                                }
                              },
                              child: const Text(
                                "Submit",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
