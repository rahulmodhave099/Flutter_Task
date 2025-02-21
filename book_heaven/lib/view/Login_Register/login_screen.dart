import 'package:book_heaven/controller/login_register_bloc/login_register_event.dart';
import 'package:book_heaven/controller/login_register_bloc/login_register_state.dart';
import 'package:book_heaven/view/Login_Register/Widgets/custom_textfield.dart';
import 'package:book_heaven/view/Login_Register/register_screen.dart';
import 'package:book_heaven/view/Widgets/custom_button.dart';
import 'package:book_heaven/view/Widgets/custom_snackbar.dart';
import 'package:book_heaven/view/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_heaven/controller/login_register_bloc/login_register_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginRegisterBloc bloc = LoginRegisterBloc();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
          bloc: bloc,
          listenWhen: (current, previous) =>
              current is LoginRegisterActionState,
          buildWhen: (current, previous) =>
              current is! LoginRegisterActionState,
          listener: (context, state) {
            ///NAVIGATE TO HOMESCREEN
            if (state is LoginWithDataState) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NavbarScreen()));
            }

            ///NAVIGATE TO REGISTERSCREEN
            else if (state is RegisterNavigateState) {

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterScreen()));
            } else if (state is LoginRegisterWithDataErrorState) {
              CustomSnackbar.customSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                  height: screenHeight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 24, right: 24, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: const Color.fromRGBO(18, 18, 18, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Welcome Back 👋",
                              style: TextStyle(
                                fontFamily: "OpenSans",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(18, 18, 18, 1),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Sign to your account",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        CustomTextfield(
                            title: "Email",
                            bloc: bloc,
                            textcontroller: bloc.emailController),
                        CustomTextfield(
                            title: "Password",
                            bloc: bloc,
                            textcontroller: bloc.passwordController),
                        Row(
                          children: [
                            Checkbox(
                                value: bloc.isChecked,
                                splashRadius: 8,
                                activeColor:
                                    const Color.fromRGBO(74, 138, 196, 1),
                                onChanged: (val) {
                                  bloc.add(OnCheckboxSelectionEvent(
                                      isChecked: val!));
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(74, 138, 196, 1),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ///ADDING LoginWithDataButtonNavigateEvent TO LOGINREGISTERBLOC

                            bloc.add(OnLoginWithDataEvent(
                                userCredential: {
                                  "email": bloc.emailController.text,
                                  "password": bloc.passwordController.text,
                                }));
                          },
                          child: const CustomButton(
                            title: "Login",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ///ADDING RegisterButtonNavigateEvent TO LOGINREGISTERBLOC
                            bloc.add(OnRegisterNavigateEvent());
                          },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 17, 
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "Register",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(74, 138, 196, 1),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Or With",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                             Container(
                              width: screenWidth,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/google.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Sign in with Google",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: screenWidth,
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(232, 232, 232, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icons/apple.png",
                                    height: 16,
                                    width: 16,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Sign in with Apple",
                                    style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color:Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
