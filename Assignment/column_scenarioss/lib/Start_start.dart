import 'package:flutter/material.dart';

class StartStart extends StatelessWidget{
  const StartStart({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : const Text("Column Scenarios", style : TextStyle( fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body : Container(
        width : MediaQuery.of(context).size.width,
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              width: 150,
              color: Colors.amberAccent,
            ),
          ],
        ),
      )
    );
}
}