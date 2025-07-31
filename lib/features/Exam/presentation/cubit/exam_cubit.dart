import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/models/answer/answer.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/usecases/get_questions_use_case.dart';
part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetQuestionsUseCase getQuestionsUseCase;
  ExamCubit(this.getQuestionsUseCase) : super(ExamInitial());
  final List<InputAnswers> answersList = [];

  Future<void> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    emit(ExamLoading());
    final result = await getQuestionsUseCase.invoke(
      token: token,
      examId: examId,
    );
    switch (result) {
      case ApiSuccessResult<List<QuestionEntity>>():
        emit(ExamSucc(questions: result.data));

      case ApiErrorResult<List<QuestionEntity>>():
        emit(
          ExamError(
            errorMessage: result.failure.errorMessage,
            code: result.failure.code,
          ),
        );
    }
  }

  void saveAnswer({required InputAnswers answerModel}) {
    answersList.add(answerModel);
  }
}
