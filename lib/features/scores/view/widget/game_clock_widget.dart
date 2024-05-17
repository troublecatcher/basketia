import 'package:basketia/features/scores/model/score/score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameClockWidget extends StatelessWidget {
  const GameClockWidget({
    super.key,
    required this.score,
  });

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Text(
      score.gameClock,
      style:
          Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
    );
  }
}
