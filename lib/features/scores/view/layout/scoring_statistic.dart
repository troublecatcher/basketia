import 'package:basketia/app/theme.dart';
import 'package:basketia/features/scores/controller/score_info_provider.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/layout/score_screen.dart';
import 'package:basketia/features/scores/view/layout/score_single_screen.dart';
import 'package:basketia/features/scores/view/widget/team_score_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoringStatistic extends ConsumerStatefulWidget {
  final Score score;
  const ScoringStatistic({
    super.key,
    required this.score,
  });

  @override
  ConsumerState<ScoringStatistic> createState() => _ScoringStatisticState();
}

class _ScoringStatisticState extends ConsumerState<ScoringStatistic> {
  @override
  void initState() {
    super.initState();
    gameIdProvider = StateProvider<String>((ref) => widget.score.gameID);
  }

  @override
  Widget build(BuildContext context) {
    final scoreInfo = ref.watch(scoreInfoProvider);
    return scoreInfo.when(
      data: (data) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scoring',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: FittedBox(
                  child: DataTable(
                    dividerThickness: 0,
                    columns: const [
                      DataColumn(label: Text('')),
                      DataColumn(label: Text('1')),
                      DataColumn(label: Text('2')),
                      DataColumn(label: Text('3')),
                      DataColumn(label: Text('4')),
                      DataColumn(label: Text('T')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text(widget.score.home)),
                          DataCell(
                            Text(data.lineScore![widget.score.home]!.q1!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.home]!.q2!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.home]!.q3!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.home]!.q4!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.home]!.totalPts!),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text(widget.score.away)),
                          DataCell(
                            Text(data.lineScore![widget.score.away]!.q1!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.away]!.q2!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.away]!.q3!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.away]!.q4!),
                          ),
                          DataCell(
                            Text(data.lineScore![widget.score.away]!.totalPts!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Statistic',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TeamScoreDetailsWidget(
                        game: data,
                        team: widget.score.home,
                        alignment: CrossAxisAlignment.start,
                      ),
                      Column(
                        children: [
                          Text(
                            'Field Goals',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            '3 Pointers',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Free Throws',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Rebounds',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Turnovers',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                      TeamScoreDetailsWidget(
                        game: data,
                        team: widget.score.away,
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: const Text('No matches for the selected date'),
        ),
      ),
      loading: () => Center(
        child: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: const CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
