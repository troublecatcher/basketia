import 'package:auto_route/auto_route.dart';
import 'package:basketia/app/router/router.dart';
import 'package:basketia/app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool share = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Column(
        children: [
          CupertinoListSection.insetGrouped(
            separatorColor: const Color.fromRGBO(235, 235, 245, 0.36),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            additionalDividerMargin: 0,
            dividerMargin: 32.w,
            margin: EdgeInsets.all(16.w),
            children: [
              Builder(builder: (ctx) {
                return CupertinoListTile(
                  backgroundColor: surfaceColor,
                  leadingSize: 24.r,
                  leadingToTitle: 8.w,
                  padding: EdgeInsets.all(16.r),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).disabledColor,
                  ),
                  title: Text(
                    'Share app',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    if (share) {
                      share = false;
                      final box = ctx.findRenderObject() as RenderBox?;
                      Share.shareWithResult('Check out Basketia!',
                              sharePositionOrigin:
                                  box!.localToGlobal(Offset.zero) & box.size)
                          .whenComplete(
                        () => share = true,
                      );
                    }
                  },
                );
              }),
              CupertinoListTile(
                backgroundColor: surfaceColor,
                leadingSize: 24.r,
                leadingToTitle: 8.w,
                padding: EdgeInsets.all(16.r),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).disabledColor,
                ),
                title: Text(
                  'Rate the app',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onTap: () async {
                  final InAppReview inAppReview = InAppReview.instance;

                  if (await inAppReview.isAvailable()) {
                    inAppReview.requestReview();
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CupertinoListSection.insetGrouped(
            separatorColor: const Color.fromRGBO(235, 235, 245, 0.36),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            additionalDividerMargin: 0,
            dividerMargin: 32.w,
            margin: EdgeInsets.all(16.w),
            children: [
              CupertinoListTile(
                backgroundColor: surfaceColor,
                leadingSize: 24.r,
                leadingToTitle: 8.w,
                padding: EdgeInsets.all(16.r),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).disabledColor,
                ),
                title: Text(
                  'Terms of Use',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onTap: () => context.router.push(const TermsOfUseRoute()),
              ),
              CupertinoListTile(
                backgroundColor: surfaceColor,
                leadingSize: 24.r,
                leadingToTitle: 8.w,
                padding: EdgeInsets.all(16.r),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).disabledColor,
                ),
                title: Text(
                  'Privacy Policy',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onTap: () => context.router.push(const PrivacyPolicyRoute()),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CupertinoListSection.insetGrouped(
            separatorColor: const Color.fromRGBO(235, 235, 245, 0.36),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            additionalDividerMargin: 0,
            dividerMargin: 32.w,
            margin: EdgeInsets.all(16.w),
            children: [
              CupertinoListTile(
                backgroundColor: surfaceColor,
                leadingSize: 24.r,
                leadingToTitle: 8.w,
                padding: EdgeInsets.all(16.r),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).disabledColor,
                ),
                title: Text(
                  'About app',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
                onTap: () => PackageInfo.fromPlatform().then(
                  (value) => context.router.push(
                    AboutAppRoute(packageInfo: value),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
