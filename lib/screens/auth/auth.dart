import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/bloc/cubits/auth/cubit/auth_cubit.dart';
import 'package:project_management/screens/auth/sign_in.dart';
import 'package:project_management/screens/auth/sign_up.dart';
import 'package:project_management/widgets/background.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    this.height,
    this.width,
    this.heightUnit,
    this.widthUnit,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? heightUnit;
  final double? widthUnit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Background(
        screenHeight: height,
        screenWidth: width,
        heightUnit: heightUnit,
        widthUnit: widthUnit,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 1000),
          child: _buildPage(context),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return IndexedStack(
          index: state is AuthSignUp ? 1 : 0,
          children: [
            AnimatedOpacity(
              opacity: state is AuthSignUp ? 0 : 1,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              child: SignInScreen(
                height: height,
                width: width,
                heightUnit: heightUnit,
                widthUnit: widthUnit,
                goToSignUpPage: () =>
                    context.read<AuthCubit>().goToSignUpPage(),
              ),
            ),
            AnimatedOpacity(
              opacity: state is AuthSignUp ? 1 : 0,
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 500),
              child: SignUpScreen(
                height: height,
                width: width,
                heightUnit: heightUnit,
                widthUnit: widthUnit,
                goToSignInPage: () =>
                    context.read<AuthCubit>().goToSignInPage(),
              ),
            ),
          ],
        );
      },
    );
  }
}
