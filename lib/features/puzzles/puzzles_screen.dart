import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/puzzles/puzzles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PuzzlesScreen extends StatelessWidget {
  const PuzzlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Puzzle Game',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        mainAxisSpacing: 8.r,
        crossAxisSpacing: 8.r,
        shrinkWrap: true,
        crossAxisCount: 2,
        children: List.generate(8, (index) {
          final puzzle = Puzzle.puzzles[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            child: Hero(
              tag: puzzle.assetName,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  puzzle.assetName,
                ),
              ),
            ),
            onPressed: () =>
                context.router.push(PuzzlesSolvingRoute(puzzle: puzzle)),
          );
        }),
      ),
    );
  }
}
