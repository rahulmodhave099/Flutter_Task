import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:advance_todo/todo_modal_class.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(), 
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State createState() => _TodoAppState();
}

class _TodoAppState extends State {

  List<TodoModal> todocards = [
    TodoModal(title: "Dart", description: "OOP , Future Async Await , Collection ", date: "3rd Sep , 2024"),
    TodoModal(title: "Flutter", description: "Stateless Widget , Container , Sized Box , Row , Column", date: "25 Sep , 2024"),
    TodoModal(title: "Flutter", description: "Stateful Widget , Figma File , Styling , Elevated Button", date: "27 Sep , 2024"),
  ];

  void submit(bool isEdit , [TodoModal? todoObj]){
    if(titleController.text.trim().isNotEmpty && despController.text.trim().isNotEmpty && dateController.text.trim().isNotEmpty){

      if(isEdit){

          /// EDIT
        setState(() {
          todoObj!.title = titleController.text.trim();
          todoObj.description = despController.text.trim();
          todoObj.date = dateController.text.trim();
        });
        

      }else{

        /// NEW ADD 
        setState(() {
          todocards.add(TodoModal(title: titleController.text.trim(), description: despController.text.trim(), date: dateController.text.trim()));
        });
        
      }
      titleController.clear();
      despController.clear();
      dateController.clear();
      Navigator.pop(context);
    }
    else{
      return ;
    }
  }


  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController despController = TextEditingController();


  void bottomSheet(bool isEdit , [TodoModal? todoObj]){
    showModalBottomSheet(isScrollControlled: true,
     context: context, 
     builder: (context){
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top : 15,
            left: 15,
            right: 15
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text("Create To-Do",style: GoogleFonts.quicksand(fontSize: 26,fontWeight: FontWeight.w800),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("Title",
                        style: GoogleFonts.quicksand(fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(2, 167, 177,1),),
                      ),
                ],
              ),
              TextField(
                controller: titleController,
                style: GoogleFonts.quicksand(fontSize: 19,fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText : "Enter Title",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Border color for all states
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,), // Color for focused state
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for enabled state
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red,), // Color for error state
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for focused+error state
                ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("Description",
                   style: GoogleFonts.quicksand(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(2, 167, 177,1),
                          ),
                          ),
                ],
              ),
              TextField(
                controller: despController,
                style: GoogleFonts.quicksand(fontSize: 19,fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText : "Enter Description",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Border color for all states
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,), // Color for focused state
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for enabled state
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red,), // Color for error state
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for focused+error state
                ),
                ),
                maxLines: null,
                minLines: 2,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Text("Date",
                   style: GoogleFonts.quicksand(fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(2, 167, 177,1),
                          ),
                          ),
                ],
              ),
              TextField(
                controller: dateController,
                style: GoogleFonts.quicksand(fontSize: 19,fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText : "Enter Date",
                  hintStyle: GoogleFonts.quicksand(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Border color for all states
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black,), // Color for focused state
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for enabled state
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red,), // Color for error state
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromRGBO(2, 167, 177,1),), // Color for focused+error state
                ),
                suffixIcon: GestureDetector(
                  child: const Icon(Icons.calendar_month),          // Calendar icon for date selection 
                ),
                ),
                readOnly: true,
                onTap: () async{
                      DateTime? pickedDate = await showDatePicker(
                        context: context, 
                        firstDate: DateTime(2024), 
                        lastDate: DateTime(2025));

                        if(pickedDate != null){
                          String formattedDate = DateFormat('d MMM yyyy').format(pickedDate);
                          setState(() {
                            dateController.text =   formattedDate;
                          });
                        }
                    },
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: (){
                      submit(isEdit,todoObj);
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(2, 167, 177, 1))
                  ),
                  child: Text("Submit",
                  style: GoogleFonts.quicksand(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),
                  ),
                  ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      );
    } 
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
        body : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,top: 50,bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Good Morning",
                    style: GoogleFonts.quicksand(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),
                    ),
                  Text("Rahul",
                    style: GoogleFonts.quicksand(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(40),topEnd: Radius.circular(40)),
                  color:  Color.fromRGBO(217, 217, 217, 1),
                ),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(20) ,child: Text("CREATE TO DO LIST",style: GoogleFonts.quicksand(fontSize: 18,fontWeight: FontWeight.w400),)),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(40),topEnd: Radius.circular(40)),
                          color:  Colors.white,
                        ),
                        child: ListView.builder(
                          itemCount: todocards.length,
                          itemBuilder: (BuildContext context , int index) {
                            return Container(
                                  decoration:const  BoxDecoration(
                                    boxShadow:[BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.16),
                                      blurRadius: 12,
                                      offset: Offset(0,4)
                                    ),] ,
                                    color: Colors.white,
                                  ),
                                  margin : const EdgeInsets.only(top: 25),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                                margin: const EdgeInsets.only(right: 15),
                                                width: 80,
                                                height: 80,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                ),
                                                child: ClipOval(
                                                  child: Image.asset("assets/images/icon.jpg",fit: BoxFit.contain,),
                                                  ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(todocards[index].title,
                                                  style: GoogleFonts.quicksand(fontSize: 18,fontWeight: FontWeight.w600),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Text(todocards[index].description,
                                                      style: GoogleFonts.quicksand(fontSize: 15,fontWeight: FontWeight.w500),
                                                      ),
                                                  Text(todocards[index].date, 
                                                    style: GoogleFonts.quicksand(fontSize: 13,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromRGBO(132, 132, 132, 1),
                                                  ),
                                              ),
                                                ],
                                              ),
                                            ),
                                        ],
                                        ),
                                );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton( 
          onPressed:(){
            bottomSheet(false);
          } ,
          backgroundColor: const Color.fromRGBO(2, 167, 177,1),
          shape: const CircleBorder(),
          child: const Icon(Icons.add,color: Colors.white,size: 52,),
          ),
    );
  }
}
