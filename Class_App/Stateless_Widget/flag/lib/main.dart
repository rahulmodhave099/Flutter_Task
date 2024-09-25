import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home : Scaffold(
        appBar : AppBar(
          title : const Text("Column Container"),
          centerTitle : true,
          backgroundColor : Colors.blue,
        ),
        body : Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [
              Container(
                width : 200,
                height : 35,
                color: Colors.orange,
              ),
              Container(
                width : 200,
                height : 35,
                color: Colors.white,
                child: Image.network("https://media.istockphoto.com/id/1214007702/vector/the-ashoka-chakra-vector-icon-in-a-navy-blue-color-on-a-white-background-indian-national.jpg?s=612x612&w=0&k=20&c=lX4urbWR03cjZcZfgGlhS6OMkB01URFO4UsqtcyJ8D8="),
              ),
              Container(
                width : 200,
                height : 35,
                color: Colors.green,
              ),
            ]
          ),
        ),
      ),
    );
  }
}