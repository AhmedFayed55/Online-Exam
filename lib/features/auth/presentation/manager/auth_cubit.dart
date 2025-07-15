// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:online_exam/features/auth/data/models/login/login_request.dart';
// import 'package:online_exam/features/auth/domain/use_cases/login_use_case.dart';
// import 'package:online_exam/features/auth/presentation/manager/auth_states.dart';
//
// @injectable
// class AuthCubit extends Cubit<AuthStates> {
//   AuthCubit({required this.loginUseCase}) : super(AuthInitialState());
//
//   LoginUseCase loginUseCase;
//
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController(
//     text: "ahmedfayed@gmail.com",
//   );
//   TextEditingController password = TextEditingController(text: "123456@aA");
//
//   static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
//
//   void signIn() async {
//     if (formKey.currentState?.validate() == true) {
//       emit(LoginLoadingState());
//       var either = await loginUseCase.invoke(
//         LoginRequest(email: email.text, password: password.text),
//       );
//       either.fold(
//         (error) {
//           emit(LoginErrorState(error));
//         },
//         (response) {
//           emit(LoginSuccessState(response));
//         },
//       );
//     }
//   }
//
//   @override
//   Future<void> close() {
//     email.dispose();
//     password.dispose();
//     return super.close();
//   }
// }
