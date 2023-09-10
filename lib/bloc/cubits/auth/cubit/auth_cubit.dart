import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_management/models/admins_model.dart';
import 'package:project_management/screens/home.dart';
import 'package:project_management/services/auth_service.dart';
import 'package:project_management/services/database_service.dart';
import 'package:project_management/utils/hive/hive_manager.dart';
import 'package:project_management/utils/theme/screen_size.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthService _authService = AuthService();
  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? userNameController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();

  openAlert(String message) {
    emit(AlertOpen(message));
  }

  closeAlert() {
    emit(AlertClose());
  }

  void signIn(context) {
    emit(LoginLoading());

    _authService.signIn(emailController!.text, passwordController!.text).then(
      (user) async {
        if (user != null) {
          emit(LoginSuccess());
          HiveManager.saveUserId(user.uid);
          HiveManager.saveIsLoggedIn(true);
          final adminData = await DatabaseService().getUserData(user.uid);
          AdminModel adminModel = AdminModel(
            id: adminData.id,
            userName: adminData['userName'],
            email: adminData['email'],
            password: adminData['password'],
          );
          debugPrint(adminModel.userName);
          debugPrint("Login Success");
          debugPrint("Current State : $state");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                adminModel: adminModel,
              ),
            ),
          );
          debugPrint(
            adminModel.email,
          );
        } else {
          emit(LoginFailed('Error signing in'));
          debugPrint("Current State : $state");
        }
      },
    );
  }

  void signUp(context) {
    emit(SignUpLoading());
    final screenSize = getScreenSize(context);
    final double oneHeightUnit = screenSize.oneHeightUnit;
    final double oneWidthUnit = screenSize.oneWidthUnit;
    _authService
        .signUp(
      emailController!.text,
      passwordController!.text,
      userNameController!.text,
    )
        .then(
      (user) async {
        if (user != null) {
          HiveManager.saveUserId(user.uid);
          HiveManager.saveIsLoggedIn(true);
          final adminData = await DatabaseService().getUserData(user.uid);
          AdminModel adminModel = AdminModel(
            id: adminData.id,
            userName: adminData['userName'],
            email: adminData['email'],
            password: adminData['password'],
          );

          debugPrint("SignUp Success");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        adminModel: adminModel,
                      )));
        } else {
          // مثال: رسالة خطأ في حالة عدم الحصول على مستخدم صالح
          emit(
            SignUpFailed(
              'Sign up failed: User is null',
            ),
          );
        }
      },
    ).catchError((error) {
      // التعامل مع الأخطاء إن وجدت هنا
      emit(
        SignUpFailed(
          'Sign up failed: ${error.toString()}',
        ),
      );
    });
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
