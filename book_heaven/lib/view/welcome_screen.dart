import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_heaven/controller/login_register_bloc/login_register_bloc.dart';
import 'package:book_heaven/controller/login_register_bloc/login_register_event.dart';
import 'package:book_heaven/controller/login_register_bloc/login_register_state.dart';
import 'package:book_heaven/view/Login_Register/login_screen.dart';
import 'package:book_heaven/view/Login_Register/register_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterBloc = LoginRegisterBloc();

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<LoginRegisterBloc, LoginRegisterState>(
        bloc: loginRegisterBloc,
        listener: (context, state) {
          /// Go to login screen
          if (state is LoginNavigateState) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }

          /// Go to Register Screen
          else if (state is RegisterNavigateState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterScreen()));
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, right: 27, left: 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/welcome.png"),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                width: screenWidth / 1.8,
                child: Text(
                  "Your Bookish\nSoulmate Awaits",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(18, 18, 18, 1),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth / 1.4,
                child: Text(
                  "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromRGBO(166, 166, 166, 1),
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      loginRegisterBloc.add(OnRegisterNavigateEvent());
                    },
                    child: Container(
                      width: screenWidth,
                      margin: const EdgeInsets.only(top: 30),
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(74, 138, 196, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginRegisterBloc.add(OnLoginNavigateEvent());
                    },
                    child: Container(
                      width: screenWidth,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(229, 243, 255, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "OpenSans",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromRGBO(74, 138, 196, 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
