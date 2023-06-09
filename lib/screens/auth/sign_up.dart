// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_nullable_for_final_variable_declarations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/bloc/cubits/auth/cubit/auth_cubit.dart';
import 'package:project_management/utils/theme/images.dart';
import 'package:project_management/widgets/glass_alert.dart';
import 'package:project_management/widgets/glass_button.dart';
import 'package:project_management/widgets/glass_container.dart';
import 'package:project_management/widgets/glass_textFormField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({
    this.height,
    this.width,
    this.heightUnit,
    this.widthUnit,
    this.goToSignInPage,
    Key? key,
  }) : super(key: key);

  final TextEditingController? emailController = TextEditingController();
  final VoidCallback? goToSignInPage;
  final double? height;
  final double? heightUnit;

  final double? width;
  final double? widthUnit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final cubit = AuthCubit();
          return Center(
            child: Stack(
              children: [
                GlassmorphismContainer(
                  shadowOffset: 20,
                  shadowOpacity: 0.3,
                  blurRadius: 200,
                  shadow: false,
                  height: height! * 0.7,
                  width: width! * 0.6,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width! * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GlassmorphismTextFormField(
                              height: height! * 0.05,
                              width: width! * 0.25,
                              obscureText: false,
                              controller: cubit.userNameController!,
                              hintText: "User Name",
                            ),
                            SizedBox(
                              height: height! * 0.04,
                            ),
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
                              text: "Sign Up",
                              onPressed: () {
                                cubit.signUp();
                              },
                            ),
                            SizedBox(
                              height: height! * 0.02,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Already have an account?",
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
                                  onPressed: goToSignInPage,
                                  child: Text(
                                    'Sign In',
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
                          width: width! * 0.02,
                        ),
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
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                  letterSpacing: 1.1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
