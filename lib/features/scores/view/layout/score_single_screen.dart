import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/layout/past_games.dart';
import 'package:basketia/features/scores/view/layout/scoring_statistic.dart';
import 'package:basketia/features/scores/view/widget/game_clock_widget.dart';
import 'package:basketia/features/scores/view/widget/score_date_widget.dart';
import 'package:basketia/features/scores/view/widget/score_time_widget.dart';
import 'package:basketia/features/scores/view/widget/score_widget.dart';
import 'package:basketia/shared/custom_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class ScoreSingleScreen extends StatelessWidget {
  final Score score;
  const ScoreSingleScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final condition = score.gameStatus == 'Not Started Yet';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.router.popForced(),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            actions: condition
                ? [
                    CupertinoButton(
                      onPressed: () =>
                          context.router.push(NotificationsRoute(score: score)),
                      child: SvgPicture.asset('assets/icons/misc/bell.svg'),
                    ),
                  ]
                : null,
            expandedHeight: 250.h,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              titlePadding: EdgeInsets.all(16.r),
              centerTitle: false,
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(condition
                            ? 'assets/images/score/upcoming.jpeg'
                            : 'assets/images/score/ongoing.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(color: Colors.black.withOpacity(0.7)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child:
                          Text(condition ? 'Upcoming Match' : 'Match Results'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(score.home),
                          ],
                        ),
                        Builder(builder: (context) {
                          if (condition) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScoreDateWidget(score: score),
                                SizedBox(height: 32.h),
                                ScoreTimeWidget(
                                  score: score,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(fontSize: 32.sp),
                                ),
                              ],
                            );
                          } else {
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
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    if (homeWinning)
                                      const Icon(Icons.arrow_left,
                                          color: Colors.white)
                                    else
                                      const Icon(Icons.arrow_left,
                                          color: Colors.transparent),
                                    GameClockWidget(score: score),
                                    if (awayWinning)
                                      const Icon(Icons.arrow_right,
                                          color: Colors.white)
                                    else
                                      const Icon(Icons.arrow_right,
                                          color: Colors.transparent),
                                  ],
                                ),
                                SizedBox(height: 33.h),
                                Row(
                                  children: [
                                    Text(
                                      homePts.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            fontSize: 24.sp,
                                            color: homeColor,
                                          ),
                                    ),
                                    SizedBox(width: 30.w),
                                    Text(
                                      awayPts.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            fontSize: 24.sp,
                                            color: awayColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                        }),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(score.away),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Builder(
                  builder: (context) {
                    if (condition) {
                      return PastGames(score: score);
                    } else {
                      return ScoringStatistic(score: score);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
