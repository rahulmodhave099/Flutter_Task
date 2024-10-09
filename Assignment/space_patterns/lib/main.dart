import 'package:flutter/material.dart';
import 'package:space_patterns/space_around.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: SpaceAround(),
    );
  }
}
