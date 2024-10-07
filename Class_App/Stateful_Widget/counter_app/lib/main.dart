import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: CounterApp()
      );
  }
}

class CounterApp extends StatefulWidget{
  const CounterApp({super.key});

  @override
  State createState() => _CounterAppState();
}

class _CounterAppState extends State{
  int i = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title : const Text("Counter App",
        style : TextStyle(
          fontSize : 25,
          color: Colors.white,
          fontWeight : FontWeight.w500,
        ),
        ),
        centerTitle : true,
        backgroundColor : Colors.blue,
        ),
      body : Center(
        child: Text("$i",
          style : const TextStyle(
          fontSize : 25,
          fontWeight : FontWeight.w700,
        ),
        ),
        ),
      floatingActionButton : FloatingActionButton(
        onPressed : () {
          i++;
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child : const Icon(
          Icons.add,
          color: Colors.white,
        
        )
      )
    );
  }
}