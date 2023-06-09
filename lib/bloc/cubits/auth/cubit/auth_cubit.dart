import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_management/services/auth_service.dart';
import 'package:project_management/utils/hive/hive_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthService _authService = AuthService();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? userNameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  late bool? showAlert = false;

  openAlert(String message) {
    showAlert = true;
    emit(AlertOpen(message));
  }

  closeAlert(String message) {
    showAlert = false;
    emit(AlertClose(message));
  }

  void signIn() {
    try {
      emit(LoginLoading());

      _authService.signIn(emailController!.text, passwordController!.text).then(
        (user) {
          HiveManager.saveUserId(user?.uid ?? '');
          HiveManager.saveIsLoggedIn(true);
          debugPrint("LoginSuccess");
          debugPrint(user!.uid);
        },
      );
      emit(LoginSuccess());
    } on FirebaseException catch (e) {
      emit(
        LoginFailed(
          e.message ?? 'Login failed',
        ),
      );
      openAlert(e.message!);
    }
  }

  void signUp() {
    try {
      emit(SignUpLoading());

      _authService
          .signUp(
        emailController!.text,
        passwordController!.text,
        userNameController!.text,
      )
          .then(
        (user) {
          HiveManager.saveUserId(user?.uid ?? '');
          HiveManager.saveIsLoggedIn(true);
          debugPrint("SignUp Success");
        },
      );
      emit(SignUpSuccess());
    } on FirebaseException catch (e) {
      emit(
        SignUpFailed(
          e.message ?? 'Sign up failed',
        ),
      );
      AlertOpen(e.message!);
    }
  }

  void signOut() {
    try {
      emit(LogoutLoading());

      _authService.signOut();
      HiveManager.clearHive();
      emit(LogoutSuccess());
    } on FirebaseException catch (e) {
      emit(
        LogoutFailed(
          e.message ?? 'Logout failed',
        ),
      );
    }
  }

  void goToSignUpPage() {
    emit(AuthSignUp());
  }

  void goToSignInPage() {
    emit(AuthLogin());
  }
}
