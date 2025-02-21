import 'package:book_heaven/controller/mybag_bloc/mybag_bloc.dart';
import 'package:book_heaven/controller/mybag_bloc/mybag_event.dart';
import 'package:book_heaven/model/book_model.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.mybagBloc, required this.book});
  final MyBagBloc mybagBloc;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book.bookImage,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                )),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.bookName,
                 style: TextStyle(
                      fontFamily: "Roboto",
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(230, 235, 240, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          mybagBloc.add(OnDecreBookCountEvent(book: book));
                        },
                        child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(74, 138, 196, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:
                                const Icon(Icons.remove, color: Colors.white)),
                      ),
                      Text(
                        book.quantity.toString(),
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () {
                          mybagBloc.add(OnIncreBookCountEvent(book: book));
                        },
                        child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(74, 138, 196, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.add, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${book.bookPrice * book.quantity}",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 16,
                      color: const Color.fromRGBO(74, 138, 196, 1),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                    onTap: () {
                      mybagBloc.add(OnMyBagRemoveBookEvent(book: book));
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
