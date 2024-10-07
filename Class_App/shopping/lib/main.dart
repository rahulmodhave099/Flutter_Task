import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

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

class Shopping extends StatefulWidget{
  const Shopping({super.key});

  @override
  State createState() => _ShoppingState();

}

class _ShoppingState extends State{

  @override
  Widget build(BuildContext contest){
    return Scaffold(
      appBar : AppBar(
        title :const  Text(
          "Shoes",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
        ),
        actions:const [SizedBox(width: 50, child :Icon(Icons.shopping_cart, color: Colors.deepPurpleAccent,))],
      ),
      body : Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 380,
            child : Image.network("https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
            fit: BoxFit.cover,
            ),

          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(
                width: 15,
              ),
               Text(
                  "Nike Air Force 1''07",
                  style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent,
                ),
                padding : const EdgeInsets.all(10),
                child : const Text(
                  " SHOES ",
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent,
                ),
                padding : const EdgeInsets.all(10),
                child : const Text(
                  " FOOTWEAR ",
                  style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 380,
                child: Text(
                  "You can't stop ageing, but the Air Force 1 'Fresh' gets pretty close. Soft, textured leather helps conceal creasing and is easy to clean. The debossed branding, which replaces the woven labels, pairs with extra laces so you can eat that jam doughnut in peace.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  )
                  )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              const SizedBox(
                child: Text("Quantity", style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),   
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.remove),
              const SizedBox(
                width: 15,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                decoration : BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    ),
                ),
                width: 30,
                height: 30,
                child: const SizedBox(child : Text("1",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
              ),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.add),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: 370,
              height: 60,
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor : Colors.deepPurpleAccent,
                foregroundColor : Colors.white,
              ),
              onPressed: (){}, 
              child: const Text("PURCHASE", style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w500),),
              ),
          )
        ],
      ),
    );
  }
}
