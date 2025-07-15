import 'package:dio/dio.dart';

import '../../api_services/api_services.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiService api;

  AuthRemoteDatasourceImpl(this.api);

  @override
  Future<void> forgotPassword(String email) async {
    try {
      await api.forgotPassword(email);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Network error';
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }

  @override
  Future<void> verifyCode(String code) async {
    try {
      await api.verifyCode(code); // ← String
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? 'Network error';
    } catch (e) {
      throw 'Unexpected error: $e';
    }
  }
}
