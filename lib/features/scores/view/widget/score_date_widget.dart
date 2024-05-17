import 'package:basketia/features/scores/model/score/score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ScoreDateWidget extends StatelessWidget {
  const ScoreDateWidget({
    super.key,
    required this.score,
  });

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('EEE, M/dd').format(
        DateTime.fromMillisecondsSinceEpoch(
            double.parse(score.gameTimeEpoch).toInt() * 1000),
      ),
      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 11.sp),
    );
  }
}
