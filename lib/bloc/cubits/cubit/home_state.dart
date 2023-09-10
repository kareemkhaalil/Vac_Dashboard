part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeCloseDrawer extends HomeState {}

class HomeOpenDrawer extends HomeState {}

class DashboardPage extends HomeState {}

class AdminsPage extends HomeState {}

class ArticlesPage extends HomeState {}

class IconsPage extends HomeState {}

class TagsPage extends HomeState {}

class ScadulePage extends HomeState {}

class DropdownMenuOpen extends HomeState {}

class DropdownMenuClosed extends HomeState {}

class LogoutLoading extends HomeState {}

class LogoutSuccess extends HomeState {}

class LogoutFailed extends HomeState {
  final String message;

  const LogoutFailed(this.message);
}
