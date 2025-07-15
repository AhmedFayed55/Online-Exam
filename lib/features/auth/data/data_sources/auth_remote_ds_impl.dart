// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import '../../../../core/errors/failures.dart';
// import '../../../../core/network/api_services.dart';
// import '../../../../core/utils/app_constants.dart';
// import '../models/login/login_request.dart';
// import '../models/login/login_response_dm.dart';
// import 'auth_remote_ds.dart';
//
// @Injectable(as: AuthRemoteDataSource)
// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   final ApiServices apiServices;
//
//   AuthRemoteDataSourceImpl(this.apiServices);
//
//   @override
//   Future<Either<Failures, LoginResponseDm>> signIn(
//     LoginRequest loginRequest,
//   ) async {
//     final bool isConnected =
//         await InternetConnectionChecker.instance.hasConnection;
//
//     if (!isConnected) {
//       return Left(NetworkError(errorMessage: AppConstants.noInternet));
//     }
//
//     try {
//       var response = await apiServices.signIn(loginRequest);
//
//       if (response.message == AppConstants.responseSuccess) {
//         return Right(response);
//       } else {
//         return Left(ServerError(errorMessage: response.message ?? ''));
//       }
//     } catch (e) {
//       return Left(ServerError(errorMessage: e.toString()));
//     }
//   }
// }
