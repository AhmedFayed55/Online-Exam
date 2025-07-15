import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://exam.elevateegy.com/api/v1",
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Response> forgotPassword(String email) async {
    return await _dio.post(
      '/auth/forgotPassword',
      data: {'email': email},
    );
  }

  Future<void> verifyCode(String code) async {
    print('🔼 Sending code: $code');
    try {
      final response = await _dio.post(
        '/auth/verifyResetCode',
        data: jsonEncode({'resetCode': code}),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return;
      } else {
        throw response.data['message'] ?? 'Invalid code';
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Dio error';
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
