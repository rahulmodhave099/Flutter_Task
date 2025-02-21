import 'package:book_heaven/controller/home_bloc/home_bloc.dart';
import 'package:book_heaven/controller/home_bloc/home_event.dart';
import 'package:book_heaven/controller/home_bloc/home_state.dart';
import 'package:book_heaven/model/book_model.dart';
import 'package:book_heaven/view/Widgets/custom_button.dart';
import 'package:book_heaven/view/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final HomeBloc homeBloc = HomeBloc();

    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeBookAddedBagActionState) {
            CustomSnackbar.customSnackbar(context, state.message);
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          Book updatedBook = (state is BookUpdatedState) ? state.book : book;
          return SizedBox(
            height: screenHeight - 20,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: SizedBox(
                        width: 75,
                        child: Divider(
                          color: Color.fromRGBO(225, 226, 227, 1),
                          thickness: 4,
                        )),
                  ),
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          updatedBook.bookImage,
                          height: 320,
                          width: 250,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        book.bookName,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            homeBloc
                                .add(OnFavouriteEvent(book: updatedBook));
                          },
                          icon: Icon(
                            updatedBook.isFev
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: const Color.fromRGBO(74, 138, 196, 1),
                            size: 30,
                          )),
                    ],
                  ),
                  Image.asset(
                    book.vendor,
                    height: 35,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    book.description,
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Review",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Image.asset(
                        "assets/images/reviews.png",
                      )
                      // const RatingWidget(isMutable: true),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(
                              OnDecreProductEvent(book: updatedBook));
                        },
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: (updatedBook.quantity == 1)
                                  ? Colors.grey
                                  : const Color.fromRGBO(74, 138, 196, 1),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.remove,
                                color: (updatedBook.quantity == 1)
                                    ? const Color.fromRGBO(74, 138, 196, 1)
                                    : Colors.white,
                                size: 28,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        updatedBook.quantity.toString(),
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(
                              OnIncreProductEvent(book: updatedBook));
                        },
                        child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color.fromRGBO(74, 138, 196, 1),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 28,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Price
                      Text(
                        "\$${book.bookPrice * updatedBook.quantity}",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(74, 138, 196, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeBloc.add(OnHomeAddToCartButtonEvent(
                              clickedBook: updatedBook));
                        },
                        child: const SizedBox(
                          width: 160,
                          child: CustomButton(title: "Add to Bag"),
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                        child: CustomButton(
                          title: "Buy Now",
                          backgroundColor: Colors.white,
                          textColor: Color.fromRGBO(74, 138, 196, 1),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
