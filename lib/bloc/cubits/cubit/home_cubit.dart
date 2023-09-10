import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_management/bloc/cubits/auth/cubit/auth_cubit.dart';
import 'package:project_management/screens/auth/auth.dart';
import 'package:project_management/services/auth_service.dart';
import 'package:project_management/utils/hive/hive_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final AuthService _authService = AuthService();
  AuthCubit authCubit = AuthCubit();

  double scale = 0.05;
  double dropScale = 0;
  bool drawerOpen = false;
  bool dropOpen = false;
  int? currentPageIndex = 0;
  dashboardPage() {
    currentPageIndex = 0;
    emit(DashboardPage());
  }

  adminsPage() {
    currentPageIndex = 1;
    emit(AdminsPage());
  }

  articlesPage() {
    currentPageIndex = 2;
    emit(ArticlesPage());
  }

  scadulePage() {
    currentPageIndex = 3;
    emit(ScadulePage());
  }

  tagsPage() {
    currentPageIndex = 4;
    emit(TagsPage());
  }

  iconsPage() {
    currentPageIndex = 5;
    emit(IconsPage());
  }

  void toggleDrawer() {
    if (scale == 0.05) {
      scale = 0.15;
      drawerOpen = true;
      emit(HomeOpenDrawer());
    } else {
      scale = 0.05;
      drawerOpen = false;
      emit(HomeCloseDrawer());
    }
  }
  //   width: width! * 0.15,
  //    height: height! * 0.05,

  void toggleDropDown() {
    if (dropScale == 0.0) {
      dropScale = 0.2;
      dropOpen = true;
      emit(DropdownMenuOpen());
    } else {
      dropScale = 0.0;
      dropOpen = false;
      emit(DropdownMenuClosed());
    }
  }

  signOut(context) {
    emit(LogoutLoading());
    try {
      _authService.signOut();
      HiveManager.clearHive();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthScreen()));
      emit(LogoutSuccess());

      authCubit.goToSignInPage();
    } on FirebaseException catch (e) {
      emit(
        LogoutFailed(
          e.message ?? 'Logout failed',
        ),
      );
    }
  }

  // إضافة الدوال المستخدمة في واجهة المستخدم للقائمة المنسدلة
  void openDropdownMenu() {
    emit(DropdownMenuOpen());
  }

  void closeDropdownMenu() {
    emit(DropdownMenuClosed());
  }
}
