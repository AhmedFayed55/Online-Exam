import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/config/theme/colors.dart';

class NavBarSellectedIcon extends StatelessWidget {
  const NavBarSellectedIcon({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 32.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: AppColors.blue[10],
      ),
      child: Center(
        child: SvgPicture.asset(icon, height: 24.h, width: 24.w),
      ),
    );
  }
}
