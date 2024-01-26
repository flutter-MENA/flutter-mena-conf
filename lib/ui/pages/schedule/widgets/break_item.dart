import 'package:flutter/material.dart';
import 'package:mena_conf/core/models/schedule.dart';
import 'package:mena_conf/core/utils/utils.dart';
import 'package:mena_conf/ui/pages/schedule/widgets/time_widget.dart';

class BreakItem extends StatelessWidget {
  const BreakItem({super.key, required this.scheduleBreak});

  final ScheduleItem scheduleBreak;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          TimeWidget(date: scheduleBreak.time),
          Text(scheduleBreak.title),
        ],
      ),
    );
  }
}