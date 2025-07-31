import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helpers/shared_pref.dart';
import 'package:online_exam/core/helpers/spacing.dart';
import 'package:online_exam/core/network/api_constants.dart';
import 'package:online_exam/features/Exam/presentation/cubit/exam_cubit.dart';
import 'package:online_exam/features/Exam/presentation/widgets/custom_liner_progress_indicator.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_app_bar.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_controll_buttons_widget.dart';
import 'package:online_exam/features/Exam/presentation/widgets/exam_page_view.dart';

class ExamScreenBody extends StatefulWidget {
  const ExamScreenBody({super.key});

  @override
  State<ExamScreenBody> createState() => _ExamScreenBodyState();
}

class _ExamScreenBodyState extends State<ExamScreenBody> {
  @override
  void initState() {
    context.read<ExamCubit>().getAllQuestionsOnExam(
      token: SharedPrefHelper.getData(key: ApiConstants.token) as String,
      examId: '670070a830a3c3c1944a9c63',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          if (state is ExamSucc) {
            return Column(
              children: [
                const ExamAppBar(),
                verticalSpace(22.h),
                CustomLinerProgressIndicator(
                  questionsLength: state.questions.length,
                ),
                verticalSpace(29.h),
                ExamPageView(listOfQuestions: state.questions),
                verticalSpace(80.h),
                ExamControllWidget(questionsList: state.questions),
              ],
            );
          }
          if (state is ExamError) {
            return Center(child: Text(state.errorMessage));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
