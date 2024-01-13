import 'package:mena_conf/core/models/gender.dart';


class ContributorJSONModelKeys {
  static const id = 'id';
  static const name = 'name';
  static const secondName = 'secondName';
  static const bio = 'bio';
  static const email = 'email';
  static const xUserName = 'xUserName';
  static const linkedinLink = 'linkedinLink';
  static const xLink = 'xLink';
  static const photoUrl = 'photoUrl';
  static const gender = 'gender';
  static const type = 'type';

}

enum ContributorType {
  speaker,
  trainer,
  organizer,
  host,
  other
}

/// A contributor model
class Contributor {

  /// The user id
  final String id;

  /// The user name
  final String name;

  /// The user second name
  final String secondName;

  /// The user bio
  final String bio;

  /// The user email
  final String email;

  /// The user twitter username
  final String? xUserName;

  /// The user linkedin profile link
  final String? linkedinLink;

  /// The x profile link
  final String? xLink;


  final ContributorType type;

  /// The user photo
  final String photoUrl;

  /// The user gender
  final Gender gender;

  Contributor({
    required this.id,
    required this.name,
    required this.secondName,
    required this.bio,
    required this.email,
    required this.type,
    this.xUserName,
    this.linkedinLink,
    this.xLink,
    required this.photoUrl,
    required this.gender
  });



  factory Contributor.fromJSON(Map<String, dynamic> json) => Contributor(
    id: json[ContributorJSONModelKeys.id],
    name: json[ContributorJSONModelKeys.name],
    secondName: json[ContributorJSONModelKeys.secondName],
    bio: json[ContributorJSONModelKeys.bio],
    email: json[ContributorJSONModelKeys.email],
    type: ContributorType.values[json[ContributorJSONModelKeys.type]],
    xUserName: json[ContributorJSONModelKeys.xUserName],
    linkedinLink: json[ContributorJSONModelKeys.linkedinLink],
    xLink: json[ContributorJSONModelKeys.xLink],
    photoUrl: json[ContributorJSONModelKeys.photoUrl],
    gender: Gender.values[json[ContributorJSONModelKeys.gender]]
  );


  Map<String, dynamic> toJSON() => {
    ContributorJSONModelKeys.id: id,
    ContributorJSONModelKeys.name: name,
    ContributorJSONModelKeys.secondName: secondName,
    ContributorJSONModelKeys.bio: bio,
    ContributorJSONModelKeys.email: email,
    ContributorJSONModelKeys.xUserName: xUserName,
    ContributorJSONModelKeys.linkedinLink: linkedinLink,
    ContributorJSONModelKeys.xLink: xLink,
    ContributorJSONModelKeys.photoUrl: photoUrl,
    ContributorJSONModelKeys.gender: gender.index
  };
}