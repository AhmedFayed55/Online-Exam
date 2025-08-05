import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_remote_data_source.dart';
import 'package:online_exam/features/Exam/data/models/answer/user_answer_input_model.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/entities/score_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource _examRemoteDataSource;
  ExamRepoImpl(this._examRemoteDataSource);
  @override
  Future<Apiresult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    Apiresult<List<QuestionEntity>> questions = await _examRemoteDataSource
        .getAllQuestionsOnExam(token: token, examId: examId);
    return questions;
  }

  @override
  Future<Apiresult<ScoreEntity>> checkExamAnswers({
    required UserAnswerInputModel inputModel,
    required String token,
  }) {
    return _examRemoteDataSource.checkExamAnswers(
      inputModel: inputModel,
      token: token,
    );
  }
}
