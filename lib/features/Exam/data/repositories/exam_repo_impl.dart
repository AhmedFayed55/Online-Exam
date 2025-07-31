// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/data/datasources/exam_remote_data_source.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';
import 'package:online_exam/features/Exam/domain/repositories/exam_repo.dart';

@Injectable(as: ExamRepo)
class ExamRepoImpl implements ExamRepo {
  final ExamRemoteDataSource examRemoteDataSource;
  ExamRepoImpl({required this.examRemoteDataSource});
  @override
  Future<Apiresult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  }) async {
    Apiresult<List<QuestionEntity>> questions = await examRemoteDataSource
        .getAllQuestionsOnExam(token: token, examId: examId);
    return questions;
  }
}
