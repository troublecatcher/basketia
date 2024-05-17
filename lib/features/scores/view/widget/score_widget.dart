import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/widget/score_comparison_widget.dart';
import 'package:basketia/features/scores/view/widget/score_date_widget.dart';
import 'package:basketia/features/scores/view/widget/score_time_widget.dart';
import 'package:basketia/features/scores/view/widget/team_name_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ScoreWidget extends StatelessWidget {
  const ScoreWidget({
    super.key,
    required this.score,
  });

  final Score score;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => context.router.push(ScoreSingleRoute(score: score)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                'assets/images/score/score.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: ScoreDateWidget(score: score),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [TeamNameWidget(data: score.home)],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            score.gameStatus,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 33.h),
                          Builder(builder: (context) {
                            if (score.gameStatus == 'Not Started Yet') {
                              return ScoreTimeWidget(
                                score: score,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(fontSize: 24.sp),
                              );
                            } else {
                              return ScoreComparisonWidget(score: score);
                            }
                          }),
                          SizedBox(height: 13.h),
                          Text(
                            '(${score.homePts.isEmpty ? '0' : score.homePts}-${score.awayPts.isEmpty ? '0' : score.awayPts})',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 11.sp),
                          ),
                        ],
                      ),
                      Column(
                        children: [TeamNameWidget(data: score.away)],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
