import 'package:auto_route/auto_route.dart';
import 'package:basketia/features/scores/controller/score_provider.dart';
import 'package:basketia/features/scores/view/bottom_sheets/date_time_bottom_sheet.dart';
import 'package:basketia/features/scores/view/widget/date_widget.dart';
import 'package:basketia/features/scores/view/widget/score_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

late StateProvider<DateTime> dateProvider;
late StateProvider<String> gameIdProvider;

@RoutePage()
class ScoreScreen extends ConsumerStatefulWidget {
  const ScoreScreen({super.key});

  @override
  ConsumerState<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends ConsumerState<ScoreScreen> {
  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    dateProvider = StateProvider<DateTime>((ref) => now);
    // dateProvider = StateProvider<String>((ref) => '20240107');
  }

  @override
  Widget build(BuildContext context) {
    final matchData = ref.watch(scoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Score',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => const DateTimeBottomSheet(),
            ),
            child: SvgPicture.asset(
              'assets/icons/navbar/matches.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            sliver: const SliverToBoxAdapter(
              child: DateWidget(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 16.h, left: 16.w),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Matches',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          matchData.when(
            data: (data) {
              return SliverList.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final score = data[index];
                  return ScoreWidget(score: score);
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            },
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Text('No matches for the selected date'),
                ),
              ),
            ),
            loading: () => SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
