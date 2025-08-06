import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  String id;
  String name;
  Data data;

  Profile({required this.id, required this.name, required this.data});

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "data": data.toJson(),
  };

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, data: $data)';
  }
}

class Data {
  String profession;
  String profileDescription;
  String qualification;
  String experience;

  Data({
    required this.profession,
    required this.profileDescription,
    required this.qualification,
    required this.experience,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profession: json["profession"],
    profileDescription: json["Profile Description"],
    qualification: json["Qualification"],
    experience: json["Experience"],
  );

  Map<String, dynamic> toJson() => {
    "profession": profession,
    "Profile Description": profileDescription,
    "Qualification": qualification,
    "Experience": experience,
  };

  @override
  String toString() {
    return 'Data(profession: $profession, profileDescription: $profileDescription, qualification: $qualification, experience: $experience)';
  }
}
