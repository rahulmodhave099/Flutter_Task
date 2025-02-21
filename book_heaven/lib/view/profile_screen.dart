import 'package:book_heaven/controller/firebase/firebase_data.dart';
import 'package:book_heaven/view/Login_Register/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Center(
        child: IconButton(
            onPressed: () {
              FirebaseData.logoutFromFirebase();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(74, 138, 196, 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.logout_rounded,color: Colors.white,))
              ),
      ),
    );
  }
}
