import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/init/remote_config_service.dart';
import 'package:basketia/app/router/tabs_wrapper_screen.dart';
import 'package:basketia/features/scores/model/score/score.dart';
import 'package:basketia/features/scores/view/layout/notifications_screen.dart';
import 'package:basketia/features/scores/view/layout/score_screen.dart';
import 'package:basketia/features/scores/view/layout/score_single_screen.dart';
import 'package:basketia/features/news/news.dart';
import 'package:basketia/features/news/news_all_screen.dart';
import 'package:basketia/features/news/news_screen.dart';
import 'package:basketia/features/news/news_single_screen.dart';
import 'package:basketia/features/news/news_wrapper_screen.dart';
import 'package:basketia/features/onboarding/onboarding_screen.dart';
import 'package:basketia/features/puzzles/puzzles.dart';
import 'package:basketia/features/puzzles/puzzles_screen.dart';
import 'package:basketia/features/puzzles/puzzles_solving_screen.dart';
import 'package:basketia/features/scores/view/layout/score_wrapper_screen.dart';
import 'package:basketia/features/settings/about_app_screen.dart';
import 'package:basketia/features/settings/privacy_policy_screen.dart';
import 'package:basketia/features/settings/promotion_screen.dart';
import 'package:basketia/features/settings/settings_screen.dart';
import 'package:basketia/features/settings/terms_of_use_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes {
    final promotion = GetIt.I<RemoteConfigService>().promotion;
    final showPromotion = promotion != null && promotion.isNotEmpty;
    final isFirstTime = GetIt.I<SharedPreferences>().getBool('ft') ?? true;
    return [
      AutoRoute(
          page: OnboardingRoute.page, initial: isFirstTime && !showPromotion),
      AutoRoute(
          page: TabWrapperRoute.page,
          initial: !isFirstTime && !showPromotion,
          children: [
            AutoRoute(page: ScoreWrapperRoute.page, children: [
              AutoRoute(page: ScoreRoute.page),
              AutoRoute(page: ScoreSingleRoute.page),
              AutoRoute(page: NotificationsRoute.page),
            ]),
            AutoRoute(page: PuzzlesRoute.page),
            AutoRoute(
              page: NewsWrapperRoute.page,
              children: [
                AutoRoute(page: NewsRoute.page),
                AutoRoute(page: NewsAllRoute.page),
                AutoRoute(page: NewsSingleRoute.page),
              ],
            ),
            AutoRoute(page: SettingsRoute.page),
          ]),
      AutoRoute(page: PuzzlesSolvingRoute.page),
      AutoRoute(page: PromotionRoute.page, initial: showPromotion),
      AutoRoute(page: PrivacyPolicyRoute.page),
      AutoRoute(page: TermsOfUseRoute.page),
      AutoRoute(page: AboutAppRoute.page),
    ];
  }
}
