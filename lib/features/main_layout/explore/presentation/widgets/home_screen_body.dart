import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/l10n/translations/app_localizations.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const CustommTextField(),
        ),
        verticalSpace(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
          child: Text(
            AppLocalizations.of(context)!.browse_by_subject,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontSize: 18.sp),
          ),
        ),

        const Expanded(child: ExamSubjectCustomListView()),
      ],
    );
  }
}

class CustommTextField extends StatelessWidget {
  const CustommTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        hint: Text('Search'),
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
}

class ExamSubjectCustomListView extends StatelessWidget {
  const ExamSubjectCustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
      itemCount: 10,
      separatorBuilder: (context, index) => verticalSpace(16),
      itemBuilder: (context, index) => const CustomSubjectItem(),
    );
  }
}

class CustomSubjectItem extends StatelessWidget {
  const CustomSubjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              child: Image.network(
                'https://exam.elevateegy.com/uploads/categories/6751d74ccc3deba60dd5bc88-item_3.png',
              ),
            ),
            horizontalSpace(8),
            Text('Physics', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
