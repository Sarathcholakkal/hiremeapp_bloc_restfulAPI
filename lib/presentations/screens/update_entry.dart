import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_app/profile_bloc/profile_bloc.dart';
import 'package:hireme_app/model/model.dart';
import 'package:hireme_app/presentations/widgets/text_field_title.dart';
import 'package:hireme_app/utils/const.dart';
import 'package:hireme_app/utils/text_validator.dart';

class UpdateEntry extends StatefulWidget {
  final Profile userprofile;
  const UpdateEntry({required this.userprofile});

  @override
  State<UpdateEntry> createState() => _UpdateEntryState();
}

class _UpdateEntryState extends State<UpdateEntry> {
  final GlobalKey<FormState> _signInKey = GlobalKey();

  //! varible decleration
  late TextEditingController _nameController;
  late TextEditingController _professionController;
  late TextEditingController _professiondescripiton;

  late TextEditingController _qualificationController;
  late TextEditingController _experienceController;

  // ! help to clear text field

  void clearField() {
    _qualificationController.clear();

    _professionController.clear();
  }
  // ! onsubmitted fun for create instace of student using  input field

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.userprofile.name);
    _professionController = TextEditingController(
      text: widget.userprofile.data.profession,
    );
    _professiondescripiton = TextEditingController(
      text: widget.userprofile.data.profileDescription,
    );
    _qualificationController = TextEditingController(
      text: widget.userprofile.data.qualification,
    );
    _experienceController = TextEditingController(
      text: widget.userprofile.data.experience,
    );
    super.initState();
  }

  Future<void> onSubmit(BuildContext ctx) async {
    final name = _nameController.text.trim();
    final profession = _professionController.text.trim();
    final descriptions = _professiondescripiton.text.trim();
    final qulification = _qualificationController.text.trim();
    final experinece = _experienceController.text.trim();

    final userprofile = Profile(
      id: widget.userprofile.id,
      name: name,
      data: Data(
        profession: profession,
        profileDescription: descriptions,
        qualification: qulification,
        experience: experinece,
      ),
    );

    context.read<ProfileBloc>().add(ProfilePutEvent(userprofile: userprofile));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Entry",
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
                            controller: _nameController,
                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Name',
                            ),
                            validator: TextValidator(fieldName: 'name').call,
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
                            controller: _professiondescripiton,
                            minLines: 4,
                            maxLines: 5,

                            decoration: texfieldDecoration.copyWith(
                              hintText: 'Enter Profession Description',
                            ),
                            validator: TextValidator(
                              fieldName: 'Description',
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
                              fieldName: 'quealification',
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
                            validator: TextValidator(fieldName: 'CGPA').call,
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
