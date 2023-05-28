import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_management/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthService _authService = AuthService();

  void signIn(String email, String password) {
    try {
      emit(LoginLoading());

      _authService.signIn(email, password).then(
        (user) {
          print(user?.email);
        },
      );
      emit(LoginSuccess());
    } on FirebaseException catch (e) {
      emit(
        LoginFailed(
          e.message ?? 'Login failed',
        ),
      );
    }
  }

  void signUp(String email, String password, String username) {
    try {
      emit(SignUpLoading());

      _authService.signUp(email, password, username).then(
        (user) {
          print(user?.email);
        },
      );
      emit(SignUpSuccess());
    } on FirebaseException catch (e) {
      emit(
        SignUpFailed(
          e.message ?? 'Sign up failed',
        ),
      );
    }
  }

  void signOut() {
    try {
      emit(LogoutLoading());

      _authService.signOut();
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
