import 'package:mena_conf/core/models/contributor.dart';

class ScheduleJSONKeys {
  static const id = 'id';
  static const days = 'days';
  static const items = 'items';
  static const title = 'title';
  static const description = 'description';
  static const type = 'type';
}

enum ScheduleItemType {
  withContributors,
  withoutContributors
}


class ContributorsData {
  /// The contributor id
  final String id;

  /// The contributor name
  final String name;

  /// The contributor second name
  final String secondName;

  /// The contributor photo url
  final String photoUrl;

  const ContributorsData({
    required this.id,
    required this.name,
    required this.secondName,
    required this.photoUrl
  });

  factory ContributorsData.fromJSON(Map<String, dynamic> json) => ContributorsData(
    id: json[ContributorJSONModelKeys.id],
    name: json[ContributorJSONModelKeys.name],
    secondName: json[ContributorJSONModelKeys.secondName],
    photoUrl: json[ContributorJSONModelKeys.photoUrl]
  );

  Map<String, dynamic> toJSON() => {
    ContributorJSONModelKeys.id: id,
    ContributorJSONModelKeys.name: name,
    ContributorJSONModelKeys.secondName: secondName,
    ContributorJSONModelKeys.photoUrl: photoUrl
  };

}

class ScheduleItem{
  /// The schedule item title
  final String title;
  /// The schedule item description
  final String description;
  /// The schedule item type
  final ScheduleItemType type;
  /// The schedule item contributors data if [type] is [ScheduleItemType.withContributors]
  final List<ContributorsData>? contributorsData;

  const ScheduleItem({
    required this.title,
    required this.description,
    required this.type,
    this.contributorsData
  });

  factory ScheduleItem.fromJSON(Map<String, dynamic> json) => ScheduleItem(
    title: json[ScheduleJSONKeys.title],
    description: json[ScheduleJSONKeys.description],
    type: ScheduleItemType.values[json[ScheduleJSONKeys.type]],
    contributorsData: json[ScheduleJSONKeys.items] != null ? (json[ScheduleJSONKeys.items] as List).map((e) => ContributorsData.fromJSON(e)).toList() : null
  );

  Map<String, dynamic> toJSON() => {
    ScheduleJSONKeys.title: title,
    ScheduleJSONKeys.description: description,
    ScheduleJSONKeys.type: type.index
  };

}

class ScheduleDay {

  /// The schedule day title
  final String title;

  /// The schedule day description
  final String description;

  /// The date of the schedule day
  final DateTime date;

  /// The schedule day items
  final List<ScheduleItem> items;

  ScheduleDay({
    required this.title,
    required this.description,
    required this.date,
    required this.items
  });

  factory ScheduleDay.fromJSON(Map<String, dynamic> json) => ScheduleDay(
    title: json[ScheduleJSONKeys.title],
    description: json[ScheduleJSONKeys.description],
    date: DateTime.parse(json[ScheduleJSONKeys.days]),
    items: (json[ScheduleJSONKeys.items] as List).map((e) => ScheduleItem.fromJSON(e)).toList()
  );

  Map<String, dynamic> toJSON() => {
    ScheduleJSONKeys.title: title,
    ScheduleJSONKeys.description: description,
    ScheduleJSONKeys.days: date.toIso8601String(),
    ScheduleJSONKeys.items: items.map((e) => e.toJSON()).toList()
  };


}

class Schedule {

  /// The schedule id
  final String id;

  /// The schedule title
  final List<ScheduleDay> days;

  Schedule({
    required this.id,
    required this.days
  });

  factory Schedule.fromJSON(Map<String, dynamic> json) => Schedule(
    id: json[ScheduleJSONKeys.id],
    days: (json[ScheduleJSONKeys.days] as List).map((e) => ScheduleDay.fromJSON(e)).toList()
  );

  Map<String, dynamic> toJSON() => {
    ScheduleJSONKeys.id: id,
    ScheduleJSONKeys.days: days.map((e) => e.toJSON()).toList()
  };



}