import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String assetPath;
  final bool active;
  const CustomIcon({super.key, required this.assetPath, required this.active});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SvgPicture.asset(
        width: 40,
        height: 35,
        assetPath,
        colorFilter: ColorFilter.mode(
          active
              ? Theme.of(context).primaryColor
              : const Color.fromRGBO(142, 142, 147, 1),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
