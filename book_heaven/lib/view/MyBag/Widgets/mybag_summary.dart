import 'package:book_heaven/model/book_model.dart';

import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double totalPrice;
  final List<Book> cartItems;

  const CartSummary(
      {super.key, required this.totalPrice, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  Book book = cartItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          book.bookName,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Text(
                          "\$${book.bookPrice}",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          const Divider(
            color: Color.fromRGBO(225, 226, 227, 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(
                  fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(
                  fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping",
                style: TextStyle(
                  fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                totalPrice != 0 ? "\$2.00" : "\$0.00",
                style: TextStyle(
                    fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
              )
            ],
          ),
          const SizedBox(height: 5),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payment",
                style: TextStyle(
                  fontFamily: "Roboto",
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                (totalPrice != 0)
                    ? "\$${(totalPrice + 2).toStringAsFixed(2)}"
                    : "\$0.00",
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(74, 138, 196, 1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
