import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';

abstract interface class ExamRepo {
  Future<ApiResult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
  Future<ApiResult<ScoreEntity>> checkExamAnswers({
    required UserAnswerInputModel inputModel,
    required String token,
  });
}
