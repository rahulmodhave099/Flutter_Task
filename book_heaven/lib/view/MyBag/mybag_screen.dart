import 'package:book_heaven/controller/mybag_bloc/mybag_bloc.dart';
import 'package:book_heaven/controller/mybag_bloc/mybag_event.dart';
import 'package:book_heaven/controller/mybag_bloc/mybag_state.dart';
import 'package:book_heaven/view/MyBag/Widgets/mybag_items_card.dart';
import 'package:book_heaven/view/MyBag/Widgets/mybag_summary.dart';
import 'package:book_heaven/view/Widgets/custom_button.dart';
import 'package:book_heaven/view/Widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  MyBagBloc mybagBloc = MyBagBloc();

  @override
  void initState() {
    mybagBloc.add(OnMyBagInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<MyBagBloc, MyBagState>(
          bloc: mybagBloc,
          listenWhen: (previous, current) => current is MyBagActionState,
          buildWhen: (previous, current) => current is! MyBagActionState,
          listener: (context, state) {
            if (state is MyBagRemoveProductActionState) {
              CustomSnackbar.customSnackbar(context, state.message);
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (MyBagLoadingState):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case const (MyBagDataState):
                final successState = state as MyBagDataState;
                // CALCULATE TOTAL ITEM COUNT AND PRICE

                double totalPrice = successState.cartList.fold(
                    0.0, (sum, item) => sum + (item.bookPrice * item.quantity));
                return SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 15, left: 15, right: 15),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "My Bag",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          successState.cartList.isNotEmpty
                              ? SizedBox(
                                  height: 360,
                                  child: ListView.separated(
                                    itemCount: successState.cartList.length,
                                    separatorBuilder: (context, index) {
                                      return const Divider(
                                        color: Color.fromRGBO(232, 232, 232, 1),
                                      );
                                    },
                                    itemBuilder: (context, index) {
                                      return CartItemCard(
                                        book: successState.cartList[index],
                                        mybagBloc: mybagBloc,
                                      );
                                    },
                                  ),
                                )
                              : SizedBox(
                                height: 360,
                                child: Center(
                                    child: Text(
                                      "No Books present in bag",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          color:Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                              ),
                          const Divider(
                            color: Color.fromRGBO(227, 228, 229, 1),
                          ),
                          const Spacer(),
                          CartSummary(
                            totalPrice: totalPrice,
                            cartItems: successState.cartList,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomButton(
                            title: "Pay Now",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              default:
                return const SizedBox();
            }
          }),
    );
  }
}
