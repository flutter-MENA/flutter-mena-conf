import 'package:flutter/material.dart';
import 'package:mena_conf/core/models/schedule.dart';
import 'package:mena_conf/core/utils/utils.dart';
import 'package:mena_conf/ui/pages/schedule/widgets/time_widget.dart';
import 'package:mena_conf/ui/shared/widgets/public_picture.dart';

class TalkItem extends StatelessWidget {

  final ScheduleItem contribution;

  const TalkItem({
    super.key,
    required this.contribution
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeWidget(date: contribution.time,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(color: Colors.white, width: 1.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contribution.title, style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: contribution.contributorsData?.map((e) => PublicPicture(url: e.photoUrl)).toList() ?? [],
                  ),
                  const SizedBox(height: 10),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}