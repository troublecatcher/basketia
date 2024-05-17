import 'package:basketia/app/theme.dart';
import 'package:basketia/features/scores/view/layout/score_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateWidget extends ConsumerWidget {
  const DateWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providedDate = ref.watch(dateProvider);
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) {
          final date = monday.add(Duration(days: index));
          final condition = providedDate.year == date.year &&
              providedDate.month == date.month &&
              providedDate.day == date.day;
          return CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => ref.read(dateProvider.notifier).state = date,
            child: Container(
              width: MediaQuery.of(context).size.width / 7 - 16.w,
              padding: EdgeInsets.symmetric(vertical: 7.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    condition ? Theme.of(context).primaryColor : surfaceColor,
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat('E').format(date)[0],
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      color: condition
                          ? Colors.white
                          : const Color.fromRGBO(142, 142, 147, 1),
                    ),
                  ),
                  Text(
                    date.day.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
