import 'package:mena_conf/core/models/gender.dart';

class UserJSONModelKeys {
  static const id = 'id';
  static const name = 'name';
  static const secondName = 'secondName';
  static const email = 'email';
  static const birthday = 'birthday';
  static const phone = 'phone';
  static const country = 'country';
  static const speciality = 'speciality';
  static const createdAt = 'createdAt';
  static const gender = 'gender';
}


/// A model for user
class UserModel {
  /// The user id
  final String id;

  /// The user name
  final String name;

  /// The user second name
  final String secondName;

  /// The user email
  final String email;

  /// The user gender
  final Gender gender;

  /// The user birthday
  final DateTime? birthday;

  /// The user phone
  final String? phone;

  /// The user country
  final String? country;

  /// The user speciality
  final String? speciality;

  /// The date of  user creation in db
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.secondName,
    required this.email,
    this.birthday,
    required this.gender,
    required this.createdAt,
    this.phone,
    this.country,
    this.speciality
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserJSONModelKeys.id],
      name: json[UserJSONModelKeys.name],
      secondName: json[UserJSONModelKeys.secondName],
      email: json[UserJSONModelKeys.email],
      gender: Gender.values[json[UserJSONModelKeys.gender]],
      birthday: json[UserJSONModelKeys.birthday] != null ? DateTime.parse(json[UserJSONModelKeys.birthday]) : null,
      phone: json[UserJSONModelKeys.phone],
      country: json[UserJSONModelKeys.country],
      speciality: json[UserJSONModelKeys.speciality],
      createdAt: DateTime.parse(json[UserJSONModelKeys.createdAt]),
    );
  }

  Map<String, dynamic> toJSON() {
    return {
      UserJSONModelKeys.id: id,
      UserJSONModelKeys.name: name,
      UserJSONModelKeys.secondName: secondName,
      UserJSONModelKeys.email: email,
      UserJSONModelKeys.gender: gender.index,
      UserJSONModelKeys.birthday: birthday?.toIso8601String(),
      UserJSONModelKeys.phone: phone,
      UserJSONModelKeys.country: country,
      UserJSONModelKeys.speciality: speciality,
      UserJSONModelKeys.createdAt: createdAt.toIso8601String()
    };
  }
}