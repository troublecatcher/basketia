import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/widget/game_clock_widget.dart';
import 'package:basketia/features/scores/view/widget/score_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreComparisonWidget extends StatelessWidget {
  final Score score;
  const ScoreComparisonWidget({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    final homePts = int.parse(score.homePts);
    final awayPts = int.parse(score.awayPts);
    final homeWinning = homePts > awayPts;
    final awayWinning = awayPts > homePts;
    Color homeColor = Colors.white;
    Color awayColor = Colors.white;
    if (homeWinning) {
      awayColor = Theme.of(context).disabledColor;
    }
    if (awayWinning) {
      homeColor = Theme.of(context).disabledColor;
    }
    return Row(
      children: [
        Text(
          homePts.toString(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 24.sp,
                color: homeColor,
              ),
        ),
        SizedBox(width: 8.w),
        if (homeWinning)
          const Icon(Icons.arrow_left, color: Colors.white)
        else
          const Icon(Icons.arrow_left, color: Colors.transparent),
        GameClockWidget(score: score),
        if (awayWinning)
          const Icon(Icons.arrow_right, color: Colors.white)
        else
          const Icon(Icons.arrow_right, color: Colors.transparent),
        SizedBox(width: 8.w),
        Text(
          awayPts.toString(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 24.sp,
                color: awayColor,
              ),
        ),
      ],
    );
  }
}
