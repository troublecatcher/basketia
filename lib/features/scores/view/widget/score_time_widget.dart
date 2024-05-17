import 'package:basketia/features/scores/model/score/score.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ScoreTimeWidget extends StatelessWidget {
  final Score score;
  final TextStyle textStyle;
  const ScoreTimeWidget({
    super.key,
    required this.score,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('HH:mm').format(
        DateTime.fromMillisecondsSinceEpoch(
            double.parse(score.gameTimeEpoch).toInt() * 1000),
      ),
      style: textStyle,
    );
  }
}
