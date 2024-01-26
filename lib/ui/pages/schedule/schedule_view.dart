import 'package:flutter/material.dart';
import 'package:mena_conf/core/models/contribution.dart';
import 'package:mena_conf/core/models/schedule.dart';
import 'package:mena_conf/core/utils/utils.dart';
import 'package:mena_conf/ui/pages/schedule/schedule_view_model.dart';
import 'package:mena_conf/ui/pages/schedule/widgets/break_item.dart';
import 'package:mena_conf/ui/pages/schedule/widgets/talk_item.dart';
import 'package:stacked/stacked.dart';

class ScheduleView extends StackedView<ScheduleViewModel> {

  const ScheduleView({super.key});

  @override
  ScheduleViewModel viewModelBuilder(BuildContext context) => ScheduleViewModel();


  @override
  Widget builder(BuildContext context, ScheduleViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello', style: Theme.of(context).textTheme.titleLarge,),
              Text("Our event is fully online 🥳", style: Theme.of(context).textTheme.bodyLarge,),
            ],
          ),
        )
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 100 - 100,
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: DaysScheduleMenu()),
              ScheduleBody(),
            ],
          ),
        ),
      )
    );
  }
}

class DaysScheduleMenu extends ViewModelWidget<ScheduleViewModel> {


  const DaysScheduleMenu({super.key});

  List<Widget> _buildTabs(ScheduleViewModel viewModel) {
    final List<Widget> tabs = [];
    for(int i=0; i < viewModel.schedule.days.length; i++) {
      tabs.add(
        DayScheduleWidget(day: viewModel.schedule.days[i], tabIndex: i)
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context, ScheduleViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildTabs(viewModel)
    );
  }
}

class DayScheduleWidget extends ViewModelWidget<ScheduleViewModel> {

  const DayScheduleWidget({super.key, required this.day,required this.tabIndex});

  final ScheduleDay day;

  final int tabIndex;

  static const _tabBorderRadiusSize = 10.0;


  BorderRadius _tabBorderRadius(int size) {
    if(tabIndex == 0) {
         return BorderRadius.only(
          topLeft: const Radius.circular(_tabBorderRadiusSize),
          bottomLeft:  const Radius.circular(_tabBorderRadiusSize),
          topRight: size > 1 ? const Radius.circular(0) : const Radius.circular(_tabBorderRadiusSize),
          bottomRight: size > 1 ? const Radius.circular(0) : const Radius.circular(_tabBorderRadiusSize),
        );
    }

    if(tabIndex == size - 1) {
      return const BorderRadius.only(
        topRight: Radius.circular(_tabBorderRadiusSize),
        bottomRight: Radius.circular(_tabBorderRadiusSize)
      );
    }


    return const BorderRadius.all(Radius.zero);
  }

  @override
  Widget build(BuildContext context, ScheduleViewModel viewModel) {
    return InkWell(
      onTap: () => viewModel.onTabChange(tabIndex),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20
        ),
        decoration: BoxDecoration(
          borderRadius: _tabBorderRadius(viewModel.tabsSize),
          color: Colors.black.withOpacity(0.5),
        ),
        child: Column(
          children: [
            Text(day.title),
            if(day.description != '')
              Text(day.description),
            Text(Utils.formatToEEEMMMdDate(day.date)),
          ],
        ),
      ),
    );
  }
}

class ScheduleBody extends ViewModelWidget<ScheduleViewModel> {

  const ScheduleBody({super.key});

  @override
  Widget build(BuildContext context, ScheduleViewModel viewModel) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: viewModel.schedule.days[viewModel.currentTabIndex].items.length,
      separatorBuilder: (context, index) => Divider(thickness: 1, color: Colors.white.withOpacity(.5), height: 1),
      itemBuilder: (context, index){
        if(viewModel.schedule.days[viewModel.currentTabIndex].items[index].type == ScheduleItemType.withContributors) {
          return TalkItem(contribution: viewModel.schedule.days[viewModel.currentTabIndex].items[index]);
        }

        return BreakItem(scheduleBreak: viewModel.schedule.days[viewModel.currentTabIndex].items[index]);
      }
    );
  }

}


