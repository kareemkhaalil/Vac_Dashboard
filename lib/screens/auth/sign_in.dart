// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/bloc/cubits/auth/cubit/auth_cubit.dart';
import 'package:project_management/utils/theme/images.dart';
import 'package:project_management/widgets/glass_button.dart';
import 'package:project_management/widgets/glass_container.dart';
import 'package:project_management/widgets/glass_textFormField.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    this.height,
    this.width,
    this.heightUnit,
    this.widthUnit,
    this.goToSignUpPage,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? heightUnit;
  final double? widthUnit;
  final VoidCallback? goToSignUpPage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = AuthCubit();
          return SizedBox(
            // or SizedBox with fixed dimensions
            width: width,
            height: height,
            child: Center(
              child: GlassmorphismContainer(
                shadowOffset: 20,
                shadowOpacity: 0.3,
                blurRadius: 200,
                shadow: false,
                height: height! * 0.7,
                width: width! * 0.6,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: height! * 0.2,
                            width: width! * 0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  AppImages.loginImage,
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height! * 0.02,
                          ),
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,
                                letterSpacing: 1.1),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width! * 0.05,
                      ),
                      Container(
                        width: 1,
                        height: height! * 0.2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width! * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GlassmorphismTextFormField(
                            height: height! * 0.05,
                            width: width! * 0.25,
                            obscureText: false,
                            controller: cubit.emailController!,
                            hintText: "Email",
                          ),
                          SizedBox(
                            height: height! * 0.04,
                          ),
                          GlassmorphismTextFormField(
                            height: height! * 0.05,
                            width: width! * 0.25,
                            obscureText: true,
                            controller: cubit.passwordController!,
                            hintText: "Password",
                          ),
                          SizedBox(
                            height: height! * 0.04,
                          ),
                          GlassmorphismButton(
                            height: height! * 0.05,
                            width: width! * 0.25,
                            text: "Sign In",
                            onPressed: () {
                              cubit.signIn();
                            },
                          ),
                          SizedBox(
                            height: height! * 0.02,
                          ),
                          Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 15,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(
                                width: height! * 0.001,
                              ),
                              TextButton(
                                onPressed: goToSignUpPage,
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
