import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Category Page",
          style: TextStyle(
              fontFamily: "Roboto", fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}