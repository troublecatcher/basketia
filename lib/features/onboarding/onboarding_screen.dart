import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/features/news/news.dart';
import 'package:basketia/shared/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();
  int page = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onboarding/bg.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 40.h),
                  child: PageView(
                    controller: pageController,
                    children: const [
                      Page(
                        title: 'Welcome to the world of',
                        endWord: 'Basketball',
                        content:
                            'Here you can find all the information about news, games, scores.',
                      ),
                      Page(
                        title: 'Read the latest',
                        endWord: 'News',
                        content:
                            'Don\'t miss the latest news in the world of basketball',
                        assetName: 'assets/images/onboarding/1.png',
                      ),
                      Page(
                        title: 'Follow the',
                        endWord: 'Score',
                        content:
                            'Do not miss the opportunity to follow and find out the score of your favorite team',
                        assetName: 'assets/images/onboarding/2.png',
                      ),
                      Page(
                        title: 'Set up',
                        endWord: 'Notifications',
                        content:
                            'Do not miss the game of your favorite team during the notification',
                        assetName: 'assets/images/onboarding/3.png',
                      ),
                      Page(
                        title: 'Collect',
                        endWord: 'Puzzles',
                        content:
                            'Solve puzzles with ease thanks to smooth controls and user-friendly design',
                        assetName: 'assets/images/onboarding/4.png',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                        title: 'Continue',
                        onPressed: () {
                          if (page != 4) {
                            pageController.animateToPage(
                              ++page,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.decelerate,
                            );
                          } else {
                            endOnboarding(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CupertinoButton(
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onPressed: () {
                      endOnboarding(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void endOnboarding(BuildContext context) {
    GetIt.I<SharedPreferences>().setBool('ft', false);
    context.router.replace(const NewsRoute());
  }
}

class Page extends StatelessWidget {
  final String title;
  final String endWord;
  final String content;
  final String? assetName;
  const Page({
    super.key,
    required this.title,
    required this.endWord,
    required this.content,
    this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (assetName != null)
            Column(
              children: [
                Image.asset(
                  assetName!,
                  width: 300.w,
                  height: 420.h,
                ),
                SizedBox(height: 30.h),
              ],
            )
          else
            const Spacer(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.titleLarge,
              children: <TextSpan>[
                TextSpan(
                  text: ' $endWord',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          if (assetName == null) SizedBox(height: 104.h),
        ],
      ),
    );
  }
}
