import "package:flutter/material.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : QuizApp()
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Map> allQuestions = [
    {
      "question":"Main axis for column widget is in which direction ?",
      "options": ["horizontal","center","vertical","no main axis"],
      "correctOption":2
    },
    {
      "question":"Which Flutter class is used to define the style of text in a Text widget ?",
      "options": ["FontStyle","TextStyle","TextFormat","TextTheme"],
      "correctOption":1
    },
    {
      "question":"To Specify the children for column widget we need to give ___",
      "options": ["Set of widgets","List of widgets","Map of widgets","string of widgets"],
      "correctOption":1
    },
    {
      "question":"____ numbers of children are required in Column widget only to use the widget.",
      "options": ["2","3","1","0"],
      "correctOption":3
    },
    {
      "question":"Which of the following is not the parameter of the SizedBox Widget ?",
      "options": ["height","width","decoration","key"],
      "correctOption":2
    }
  ];

  int currentIndex = 0;
  int selectedAnswerIndex = -1;
  bool questionPage = true;
  int marks = 0;
  bool splashScreen = true;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex){
    if(selectedAnswerIndex != -1){
      if(answerIndex == allQuestions[currentIndex]["correctOption"]){
        if(selectedAnswerIndex == answerIndex){
          marks++;
        }
        return const WidgetStatePropertyAll(Colors.green);
      }else if(selectedAnswerIndex == answerIndex){
        return const WidgetStatePropertyAll(Colors.red);
      }else{
        return const WidgetStatePropertyAll(null);
      }

    }else{
      return const WidgetStatePropertyAll(null);
    }

  }

  @override
  Widget build(BuildContext context) {
    return  isQuestionScreen();
  }

  Scaffold isQuestionScreen(){
    if(splashScreen == true){
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img2.jpg"),
              fit : BoxFit.cover,
            ),
          ),
          child: Column(
            children: [const SizedBox(
                height: 200,
              ),
              Container(
                  color:const  Color.fromRGBO(163, 135, 245, 50),
                  child: const Text("  QUIZEETHON  ",
                    style : TextStyle(
                      fontSize : 40,
                      fontWeight : FontWeight.bold,
                      color: Color.fromRGBO(50, 50, 50, 1),
                  ),
                  ),
                ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child : ElevatedButton(
                      onPressed: () {
                        splashScreen = false;
                        setState(() {});
                      }, 
                        child: const  Text(
                          "Start Quiz",
                          style : TextStyle(
                            fontSize : 30,
                            fontWeight : FontWeight.w900,
                          ),
                        ),
                      )
                    ),
                ],
              ),
            ],
          ),
          ),
      );

    }else if(questionPage == true){
      return Scaffold(
      appBar : AppBar(
        title : const Text("Quiz App",
          style : TextStyle(
            fontWeight : FontWeight.w700,
            fontSize : 25,
            color : Colors.white,
          ),
        ),
      centerTitle: true,
      backgroundColor : const Color.fromRGBO(163, 135, 245,1),
      ),
      body : Container(
        decoration :  BoxDecoration(
          image : DecorationImage(
            image : const AssetImage("assets/images/img.jpg"),
            fit : BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 163, 135, 245).withOpacity(0.9),  // Adjust the opacity here
                BlendMode.dstATop,  // Blend the color with the image
            ),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height : 30,
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.spaceAround,
              children :[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all( 
                      color: Colors.white, 
                      width: 2.0, 
                    ),
                    color: const  Color.fromRGBO(163, 135, 245, 80),
                  ),
                  //color:const  Color.fromRGBO(163, 135, 245, 80),
                  child: Text(" Q. No. : ${currentIndex+1}/${allQuestions.length} ",
                    style : const  TextStyle(
                      fontSize : 24,
                      fontWeight : FontWeight.w600,
                      color: Colors.white,
                  ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all( 
                      color: Colors.white, 
                      width: 2.0, 
                    ),
                    color: const  Color.fromRGBO(163, 135, 245, 80),
                  ),
                  //color:const  Color.fromRGBO(163, 135, 245, 80),
                  child: Text(" Marks : $marks/${allQuestions.length} ",
                    style : const  TextStyle(
                      fontSize : 24,
                      fontWeight : FontWeight.w600,
                      color: Colors.white,
                  ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height : 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Container(
                  decoration: BoxDecoration(
                      border: Border.all( 
                      color: Colors.white, 
                      width: 2.0, 
                    ),
                    color: const  Color.fromRGBO(163, 135, 245, 80),
                  ),
                  width: 350 ,
                  //color: const Color.fromRGBO(163, 135, 245, 100),
                  child : Text("Q . ${allQuestions[currentIndex]["question"]}",
                    style :const  TextStyle(
                      fontSize : 25,
                      fontWeight : FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Container(
                //   width: 320,
                //   color: const Color.fromRGBO(163, 135, 245, 100),
                //   child : Text(" ${allQuestions[currentIndex]["question"]} ",
                //     style : const TextStyle(
                //       fontSize : 25,
                //       fontWeight : FontWeight.w400,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height : 30,
            ),
            SizedBox(
              width : 350,
              height : 50,
              child : ElevatedButton(
                style : ButtonStyle(
                  backgroundColor : checkAnswer(0),
                ),
                onPressed : () {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex = 0;
                    setState(() {});
                  }
                },
                child : Text(
                  " A. ${allQuestions[currentIndex]["options"][0]} ",
                  style : const TextStyle(
                    fontSize : 24,
                    fontWeight : FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height : 15,
            ),
            SizedBox(
              width : 350,
              height : 50,
              child : ElevatedButton(
                style : ButtonStyle(
                  backgroundColor : checkAnswer(1),
                ),
                onPressed : () {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex = 1;
                    setState(() {});
                  }
                },
                child : Text(
                  " B. ${allQuestions[currentIndex]["options"][1]} ",
                  style : const TextStyle(
                    fontSize : 24,
                    fontWeight : FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height : 15,
            ),
            SizedBox(
              width : 350,
              height : 50,
              child : ElevatedButton(
                style : ButtonStyle(
                  backgroundColor : checkAnswer(2),
                ),
                onPressed : () {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex = 2;
                    setState(() {});
                  }
                },
                child : Text(
                  " C. ${allQuestions[currentIndex]["options"][2]} ",
                  style : const TextStyle(
                    fontSize : 24,
                    fontWeight : FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height : 15,
            ),
            SizedBox(
              width : 350,
              height : 50,
              child : ElevatedButton(
                style : ButtonStyle(
                  backgroundColor : checkAnswer(3),
                ),
                onPressed : () {
                  if(selectedAnswerIndex == -1){
                    selectedAnswerIndex = 3;
                    setState(() {});
                  }
                },
                child : Text(
                  " D. ${allQuestions[currentIndex]["options"][3]} ",
                  style : const TextStyle(
                    fontSize : 24,
                    fontWeight : FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton : FloatingActionButton(
        onPressed : () {
          if(selectedAnswerIndex == -1){
            return ;
          }else if(currentIndex < allQuestions.length-1){
            currentIndex++;
          }else{
              questionPage = false;
            }
          selectedAnswerIndex = -1;
          setState(() {});


        },
        backgroundColor : const Color.fromRGBO(163, 135, 245, 1),
        child : const Icon(Icons.forward,color: Colors.white,),
      ),
    );
    }else{
      return Scaffold(
        appBar : AppBar(
          centerTitle: true,
          title : const Text("Quiz Result",
          style : TextStyle(
            fontWeight : FontWeight.w700,
            fontSize : 25,
            color : Colors.white,
          ),
          ),
        backgroundColor : const Color.fromRGBO(163, 135, 245, 50),
        ),
        body :  Container(
          decoration : BoxDecoration(
          image : DecorationImage(
            image : const AssetImage("assets/images/img.jpg"),
            fit : BoxFit.cover,
            colorFilter: ColorFilter.mode(
                const Color.fromARGB(255, 163, 135, 245).withOpacity(0.9),  // Adjust the opacity here
                BlendMode.dstATop,  // Blend the color with the image
            ),
              ),
            ),
          child: Center(
            child : Column(
              children : [
                const SizedBox(
                  height: 50,
                ),
                Container(
                    width: 300,
                    height: 300,
                    decoration : const BoxDecoration(
                      image : DecorationImage(
                      image : AssetImage("assets/images/trophy.png"),
                      fit : BoxFit.cover,
                        ),
                      ),
                    ),
                  Container(
                    color:const  Color.fromRGBO(163, 135, 245, 80),
                    child: const SizedBox(
                      height: 40,
                      width: 300,
                      child : Text(" CONGRATULATIONS ",
                        style : TextStyle(
                        fontWeight : FontWeight.w900,
                        fontSize : 30,
                        color : Color.fromRGBO(245, 195, 135,1),
                          ),
                        ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 140,
                    child : Text("Score : $marks / ${allQuestions.length}",
                      style : const TextStyle(
                      fontWeight : FontWeight.w700,
                      fontSize : 25,
                      color : Colors.white,
                        ),
                      ),
                  ),
              ],
            ),
            ),
        ),
          floatingActionButton : FloatingActionButton.extended(
            onPressed : () {
              if(questionPage == false){
                currentIndex = 0;
                selectedAnswerIndex = -1;
                questionPage = true;
                marks = 0;
                setState(() {});
              }
            },
            label:const Text("Restart",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            ),
            backgroundColor : const Color.fromRGBO(163, 135, 245, 1),
            icon : const Icon(Icons.restart_alt, color:  Colors.white,
            ),
        ),
      );
    }
  }
}