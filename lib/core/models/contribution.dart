
class ContributionJSONModelKeys {
  static const id = 'id';
  static const title = 'title';
  static const description = 'description';
  static const type = 'type';
  static const createdAt = 'createdAt';
  static const speakersIDs = 'speakersIDs';
  static const date = 'date';
  static const youtubeLink = 'youtubeLink';
}

enum ContributionType {
  talk,
  workshop,
  presentation,
  other
}

class Contribution {
  /// The contribution id
  final String id;

  /// The contribution title
  final String title;

  /// The contribution description
  final String description;

  /// The contribution type
  final ContributionType type;

  /// The contribution creation date
  final DateTime createdAt;

  /// The contribution speakers ids
  final List<String> speakersIDs;

  /// The contribution date
  final DateTime date;

  /// The contribution youtube link
  final String? youtubeLink;

  Contribution({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.createdAt,
    required this.speakersIDs,
    required this.date,
    this.youtubeLink
  });

  factory Contribution.fromJSON(Map<String,dynamic> json) {
    return Contribution(
      id: json[ContributionJSONModelKeys.id],
      title: json[ContributionJSONModelKeys.title],
      description: json[ContributionJSONModelKeys.description],
      type: ContributionType.values[json[ContributionJSONModelKeys.type]],
      createdAt: DateTime.parse(json[ContributionJSONModelKeys.createdAt]),
      speakersIDs: json[ContributionJSONModelKeys.speakersIDs],
      date: DateTime.parse(json[ContributionJSONModelKeys.date]),
      youtubeLink: json[ContributionJSONModelKeys.youtubeLink]
    );
  }

  /// Returns a json representation of the contribution
  Map<String, dynamic> toJSON() {
    return {
      ContributionJSONModelKeys.id: id,
      ContributionJSONModelKeys.title: title,
      ContributionJSONModelKeys.description: description,
      ContributionJSONModelKeys.type: type.index,
      ContributionJSONModelKeys.createdAt: createdAt.toIso8601String(),
      ContributionJSONModelKeys.speakersIDs: speakersIDs,
      ContributionJSONModelKeys.date: date.toIso8601String(),
      ContributionJSONModelKeys.youtubeLink: youtubeLink
    };
  }


}