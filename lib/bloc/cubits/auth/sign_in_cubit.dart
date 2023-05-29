import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_management/bloc/states/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
}
