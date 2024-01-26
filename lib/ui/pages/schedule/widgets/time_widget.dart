import 'package:flutter/material.dart';
import 'package:mena_conf/core/utils/utils.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key,required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(Utils.formatToHHmmDate(date)));
  }
}
