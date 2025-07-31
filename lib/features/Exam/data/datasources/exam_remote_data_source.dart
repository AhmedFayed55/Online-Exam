import 'package:flutter/material.dart';
import 'package:online_exam/core/errors/api_results.dart';
import 'package:online_exam/features/Exam/domain/entities/question_entity.dart';

@immutable
abstract interface class ExamRemoteDataSource {
  Future<Apiresult<List<QuestionEntity>>> getAllQuestionsOnExam({
    required String token,
    required String examId,
  });
}
