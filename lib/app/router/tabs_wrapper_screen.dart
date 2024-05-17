import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/shared/custom_icon.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabWrapperScreen extends StatelessWidget {
  const TabWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Colors.black,
      routes: const [
        NewsRoute(),
        ScoreRoute(),
        PuzzlesRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetPath: 'assets/icons/navbar/news.svg', active: false),
              activeIcon: CustomIcon(
                  assetPath: 'assets/icons/navbar/news.svg', active: true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetPath: 'assets/icons/navbar/matches.svg', active: false),
              activeIcon: CustomIcon(
                  assetPath: 'assets/icons/navbar/matches.svg', active: true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetPath: 'assets/icons/navbar/puzzles.svg', active: false),
              activeIcon: CustomIcon(
                  assetPath: 'assets/icons/navbar/puzzles.svg', active: true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                  assetPath: 'assets/icons/navbar/settings.svg', active: false),
              activeIcon: CustomIcon(
                  assetPath: 'assets/icons/navbar/settings.svg', active: true),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
