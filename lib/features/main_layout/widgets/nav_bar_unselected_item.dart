import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnSellectedIcon extends StatelessWidget {
  const NavBarUnSellectedIcon({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64.w,
      height: 32.h,
      child: Center(
        child: SvgPicture.asset(icon, height: 24.h, width: 24.w),
      ),
    );
  }
}
