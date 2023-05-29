import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_management/bloc/states/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
