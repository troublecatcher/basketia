import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

@RoutePage()
class AboutAppScreen extends StatelessWidget {
  final PackageInfo packageInfo;
  const AboutAppScreen({super.key, required this.packageInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About app',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App name: ${packageInfo.appName}'),
            Text('Package name: ${packageInfo.packageName}'),
            Text('Version: ${packageInfo.version}'),
            Text('Build number: ${packageInfo.buildNumber}'),
          ],
        ),
      ),
    );
  }
}
