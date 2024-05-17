import 'package:basketia/features/scores/model/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeamScoreDetailsWidget extends StatelessWidget {
  final Game game;
  final String team;
  final CrossAxisAlignment alignment;
  const TeamScoreDetailsWidget({
    super.key,
    required this.game,
    required this.team,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final reverse = alignment == CrossAxisAlignment.end;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        CustomTextSpan(game: game, team: team, reverse: reverse),
        SizedBox(height: 24.h),
        CustomTextSpan(game: game, team: team, reverse: reverse),
        SizedBox(height: 24.h),
        CustomTextSpan(game: game, team: team, reverse: reverse),
        SizedBox(height: 24.h),
        Text(
          '${game.teamStats![team]!.reb}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 24.h),
        Text(
          '${game.teamStats![team]!.tov}',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({
    super.key,
    required this.game,
    required this.team,
    required this.reverse,
  });

  final Game game;
  final String team;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    if (reverse) {
      return RichText(
        text: TextSpan(
          text: '(${game.teamStats![team]!.fgp}%) ',
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).disabledColor),
          children: [
            TextSpan(
              text:
                  '${game.teamStats![team]!.fgm}/${game.teamStats![team]!.fga}',
              style: Theme.of(context).textTheme.titleSmall,
              children: const [],
            )
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          text: '${game.teamStats![team]!.fgm}/${game.teamStats![team]!.fga}',
          style: Theme.of(context).textTheme.titleSmall,
          children: [
            TextSpan(
              text: ' (${game.teamStats![team]!.fgp}%)',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
          ],
        ),
      );
    }
  }
}
