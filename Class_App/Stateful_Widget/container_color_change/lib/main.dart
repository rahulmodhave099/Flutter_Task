import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home : ContainerColor(),
    );
  }
}

class ContainerColor extends StatefulWidget{
  const ContainerColor({super.key});

  @override
  State createState() => _ContainerColorState(); 
}

class _ContainerColorState extends State{

  bool colorCheck = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: const Text("Container Color Change", style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w600,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              color: colorCheck ? Colors.deepOrangeAccent : Colors.amberAccent,
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (){
                if(colorCheck){
                  colorCheck = false;
                }else{
                  colorCheck = true;
                }
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                height: 50,
                width: 150,
                color: Colors.deepPurpleAccent,
                child: const Text("Change Color",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.white),),
                ),
            ),
          ],
        ),
      ),
    );
  }
}