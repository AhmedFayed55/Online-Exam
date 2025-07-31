import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';

@injectable
abstract interface class ExamRepo {
  Future<Apiresult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
}
