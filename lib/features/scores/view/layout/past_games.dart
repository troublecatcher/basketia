import 'package:basketia/features/scores/controller/connection.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/widget/score_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class PastGames extends StatefulWidget {
  final Score score;
  const PastGames({super.key, required this.score});

  @override
  State<PastGames> createState() => _PastGamesState();
}

class _PastGamesState extends State<PastGames> {
  List<Score> pastScores = [];

  @override
  void initState() {
    super.initState();
    fetchPastScores(
      DateTime.fromMillisecondsSinceEpoch(
              double.parse(widget.score.gameTimeEpoch).toInt() * 1000)
          .subtract(
        const Duration(days: 3),
      ),
    );
  }

  void fetchPastScores(DateTime dateTime) {
    var params = {
      'gameDate': DateFormat('yyyyMMdd').format(dateTime),
      'topPerformers': 'true',
      'lineups': 'true',
    };

    GetIt.I<Dio>()
        .get<Map<String, dynamic>>(
      '$baseUrl/getNBAScoresOnly',
      queryParameters: params,
      options: Options(
        headers: headers,
      ),
    )
        .then((value) {
      if (value.statusCode == 200) {
        final data = value.data;
        if (data != null && data.containsKey('body')) {
          final gamesData = data['body'] as Map<String, dynamic>;
          List<Score> games = gamesData.entries.map((e) {
            return Score.fromJson(e.value);
          }).toList();
          setState(() {
            pastScores = games;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Past Games',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        if (pastScores.isEmpty)
          const Center(
            child: CupertinoActivityIndicator(),
          )
        else
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final score = pastScores[index];
              return ScoreWidget(score: score);
            },
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: pastScores.length,
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(),
        ),
      ],
    );
  }
}
