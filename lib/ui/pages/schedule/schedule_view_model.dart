import 'package:mena_conf/core/models/schedule.dart';
import 'package:stacked/stacked.dart';

class ScheduleViewModel extends BaseViewModel {


  final Schedule schedule = Schedule(
      id: '1',
      days: [
        ScheduleDay(
          title: 'Day 1',
          description: '',
          date: DateTime(2024, 3, 2),
          items: [
            ScheduleItem(title: 'Opening and welcome', description: '', type: ScheduleItemType.withoutContributors, time:  DateTime(2024, 3, 1, 9), contributorsData: []),
            ScheduleItem(title: 'Sayed Talk 1', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 1, 10), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Mahmoud Talk 1', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 1, 11), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Lunch Break ', description: '', type: ScheduleItemType.withoutContributors,time:  DateTime(2024, 3, 1, 12), contributorsData: []),
            ScheduleItem(title: 'Nasr Talk 1', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 1, 14), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Yassin Talk 1', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 1, 15), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Closing day 1', description: '', type: ScheduleItemType.withoutContributors,time:  DateTime(2024, 3, 1, 18), contributorsData: []),
          ]
        ),
        ScheduleDay(
          title: 'Day 2',
          description: '',
          date: DateTime(2024, 3, 3),
          items: [
            ScheduleItem(title: 'Opening day 2', description: '', type: ScheduleItemType.withoutContributors, time:  DateTime(2024, 3, 2, 9), contributorsData: []),
            ScheduleItem(title: 'Sayed Talk 2', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 2, 10), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Mahmoud Talk 2', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 2, 11), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Lunch Break', description: '', type: ScheduleItemType.withoutContributors,time:  DateTime(2024, 3, 2, 12), contributorsData: []),
            ScheduleItem(title: 'Nasr Talk 2', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 2, 14), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Yassin Talk 2', description: '', type: ScheduleItemType.withContributors, time:  DateTime(2024, 3, 2, 15), contributorsData: [ContributorsData(id: '1', name: 'Syaed Ali', secondName: 'EL kamel', photoUrl: '')]),
            ScheduleItem(title: 'Closing day 2', description: '', type: ScheduleItemType.withoutContributors,time:  DateTime(2024, 3, 2, 18), contributorsData: []),
          ]
        )
      ]
  );

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  int get tabsSize => schedule.days.length;

  void onTabChange(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

}