import "package:flutter/material.dart";


class SpaceEvenly extends StatelessWidget{
  const SpaceEvenly({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text("Space Parameters",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.amberAccent,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      );
  }
}