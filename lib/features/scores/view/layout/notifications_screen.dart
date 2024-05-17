import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/theme.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class NotificationsScreen extends StatefulWidget {
  final Score score;
  const NotificationsScreen({super.key, required this.score});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late String gameId;
  final List<String> preferences = [
    'Game Start',
    'Start Quarter',
    'Final Quarter',
    'Close Game',
    'Final',
  ];

  @override
  void initState() {
    super.initState();
    gameId = widget.score.gameID;
    print(gameId);
  }

  bool presentInPrefs(String preference) {
    final list = di<SharedPreferences>().getStringList(gameId);
    return list != null && list.contains(preference);
  }

  Future<void> rewrite(String preference) async {
    final list = di<SharedPreferences>().getStringList(gameId);
    if (list != null) {
      if (list.contains(preference)) {
        list.remove(preference);
      } else {
        list.add(preference);
      }
      await di<SharedPreferences>().setStringList(gameId, list);
    } else {
      await di<SharedPreferences>().setStringList(gameId, [preference]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set notification',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: CupertinoListSection.insetGrouped(
        separatorColor: const Color.fromRGBO(235, 235, 245, 0.36),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        additionalDividerMargin: 0,
        dividerMargin: 32.w,
        margin: EdgeInsets.all(16.w),
        children: List.generate(
          5,
          (index) {
            final preference = preferences[index];
            final value = presentInPrefs(preference);
            return CupertinoListTile(
              backgroundColor: surfaceColor,
              leadingSize: 24.r,
              leadingToTitle: 8.w,
              padding: EdgeInsets.all(16.r),
              trailing: CupertinoSwitch(
                value: value,
                onChanged: (_) {
                  rewrite(preference).then((value) => setState(() {}));
                },
              ),
              title: Text(
                preference,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
