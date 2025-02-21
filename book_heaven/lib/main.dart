import 'package:flutter/material.dart';
import 'package:book_heaven/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  /// Connecting this project to a Firebase Project
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCWxAVd8nymDGyZtPGjgTyFAnVOwXbcR5Y",
        appId: "1:765338404554:android:4c8b2dcf664f8a70739633",
        messagingSenderId: "765338404554",
        projectId: "book-heaven-4d424"),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
