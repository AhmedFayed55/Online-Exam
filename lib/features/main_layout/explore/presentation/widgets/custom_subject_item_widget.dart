import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/config/theme/colors.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/features/main_layout/explore/domain/entities/subject_entity.dart';

class CustomSubjectItem extends StatelessWidget {
  const CustomSubjectItem({super.key, required this.subjectEntity});
  final SubjectEntity subjectEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: const [BoxShadow(color: AppColors.grey, blurRadius: 5)],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: CachedNetworkImage(
                imageUrl: subjectEntity.image!,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 90.h,
                width: 90.w,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpace(8),
            Text(
              subjectEntity.name ?? '',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
