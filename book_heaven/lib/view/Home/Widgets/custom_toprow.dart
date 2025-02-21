import 'package:flutter/material.dart';

class CustomToprow extends StatelessWidget {
  const CustomToprow({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, bottom: 10, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color.fromRGBO(74, 138, 196, 1),
            ),
          ),
        ],
      ),
    );
  }
}
