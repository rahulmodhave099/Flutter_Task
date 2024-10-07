import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: ImageChange()
    );
  }
}

class ImageChange extends StatefulWidget{
  const ImageChange({super.key});

  @override
  State createState() => _ImageChangeState();
}

class _ImageChangeState extends State{

  List<String> images = ["https://www.hindustantimes.com/static-content/1y/cricket-logos/players/virat-kohli.png",
                         "https://images.moneycontrol.com/static-mcnews/2024/04/sachin-tendulkar-world-cup-1.jpg?impolicy=website&width=770&height=431",
                         "https://static.toiimg.com/thumb/resizemode-4,width-1280,height-720,msid-111741230/111741230.jpg",
                         "https://images.news18.com/ibnlive/uploads/2024/07/untitled-design-2024-07-06t185226.317-2024-07-0b441cf3942f5e6fd9b1f32895302a16.jpg?impolicy=website&width=640&height=480",
                         "https://thedailyguardian.com/wp-content/uploads/2023/08/STORY-3-FITNESS.jpg" 
                        ];
  int index = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title : const Text("Cricket Players"),
        backgroundColor: Colors.blue,
        centerTitle : true,
      ),
      body: Center(
        child : Column(
          mainAxisAlignment : MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child : Image.network(images[index]),
            ),
          ],)
      ),
      floatingActionButton : FloatingActionButton(
        onPressed : (){
          if(index < images.length-1){
            index++;
          }else{
            index = 0;
          }
          setState(() {});
        },
        backgroundColor : Colors.blue,
        child: const Icon(Icons.forward),
      )
    );
  }
}