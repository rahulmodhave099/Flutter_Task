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
      home :MyCart(),
      );
  }

}

class MyCart extends StatefulWidget{
  const MyCart({super.key});

  @override
  State createState() => _MyCartState();
}


class _MyCartState extends State{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar : AppBar(
        title: const Text("My Cart",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
        ),
        centerTitle : true,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.blueGrey,),
      ),
      body : Container(
        padding : const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 222, 225, 226),
              padding : const EdgeInsets.all(3),
              child : Row(
                children: [
                  Container(
                    padding : const EdgeInsets.all(5),
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/images/image.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding : const EdgeInsets.all(5),
                      child :  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nike Shoes",
                          style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 250,
                            child: Text("With iconic style and legendary comfort, on repeat.",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              const Text("\$570.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              const Spacer(),
                              const SizedBox(width: 10,),
                              const Icon(Icons.remove),
                              const SizedBox(width: 10,),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border : Border.all(width:1.0)
                                ),
                                padding : const EdgeInsets.all(5),
                                child: const Text(" 1 ",style: TextStyle( fontSize: 18,fontWeight: FontWeight.w400),)
                              ),
                              const SizedBox(width: 10,),
                              const Icon(Icons.add),
                    
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                )
            ),
            const SizedBox(height : 15),
            Container(
              color: const Color.fromARGB(255, 222, 225, 226),
              padding : const EdgeInsets.all(3),
              child : Row(
                children: [
                  Container(
                    padding : const EdgeInsets.all(5),
                    width: 150,
                    height: 150,
                    child: Image.asset("assets/images/image.png"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      padding : const EdgeInsets.all(5),
                      child :  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Nike Shoes",
                          style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 250,
                            child: Text("With iconic style and legendary comfort, on repeat.",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            children: [
                              const Text("\$77.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                              const Spacer(),
                              const SizedBox(width: 10,),
                              const Icon(Icons.remove),
                              const SizedBox(width: 10,),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border : Border.all(width:1.0)
                                ),
                                padding : const EdgeInsets.all(5),
                                child: const Text(" 1 ",style: TextStyle( fontSize: 18,fontWeight: FontWeight.w400),)
                              ),
                              const SizedBox(width: 10,),
                              const Icon(Icons.add),
                    
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                )
            ),
            const Spacer(),
            const Row(
              children: [
                SizedBox(width: 30,),
                Text("Subtotal:",style: TextStyle(fontSize: 18 ),),
                Spacer(),
                Text("\$800.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                SizedBox(width: 30,),
              ],
            ),
            const SizedBox( height: 20,),
            const Row(
              children: [
                SizedBox(width: 30,),
                Text("Delivery Fee:",style: TextStyle(fontSize: 18 ),),
                Spacer(),
                Text("\$5.00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                SizedBox(width: 30,),
              ],
            ),
            const SizedBox( height: 20,),
            const Row(
              children: [
                SizedBox(width: 30,),
                Text("Discount:",style: TextStyle(fontSize: 18 ),),
                Spacer(),
                Text("40%",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold ),),
                SizedBox(width: 30,),
              ],
            ),
            const SizedBox( height: 20,),
            SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor : Colors.deepPurpleAccent,
                foregroundColor : Colors.white,
              ),
              onPressed: (){}, 
              child: const Text("Checkout for \$400.00", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
              ),
          ),
          const SizedBox( height: 20,),
          ],
          ),
      ),
    );
  }
}
