import 'package:book_heaven/controller/home_bloc/home_bloc.dart';
import 'package:book_heaven/controller/home_bloc/home_event.dart';
import 'package:book_heaven/controller/home_bloc/home_state.dart';
import 'package:book_heaven/view/Home/Widgets/book_detail.dart';
import 'package:book_heaven/view/Home/Widgets/custom_toprow.dart';
import 'package:book_heaven/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(OnHomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
          bloc: homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          listener: (context, state) {
            if (state is HomeToBookDetailsActionState) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => BookDetail(
                        book: state.book,
                      ));
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (HomeLoadingState):
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case const (HomeLoadedSuccessState):
                final successState = state as HomeLoadedSuccessState;
                return SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight * 1.18,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 12, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset("assets/icons/Search.png"),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Image.asset("assets/icons/notification.png"),
                              ],
                            ),
                          ),
                          Container(
                            width: screenWidth,
                            padding: const EdgeInsets.only(
                              left: 23,
                            ),
                            margin: const EdgeInsets.only(
                              right: 24,
                              top: 15,
                            ),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(247, 248, 249, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Special Offer",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Discount 25%",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 130,
                                      child: CustomButton(title: "Order now"),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Image.asset("assets/images/special.png")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 24, bottom: 10, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Of Week",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "See all",
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        const Color.fromRGBO(74, 138, 196, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 230,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.bookList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    homeBloc.add(OnBookDetailEvent(
                                        clickedBook:
                                            successState.bookList[index]));
                                  },
                                  child:
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            successState
                                                .bookList[index].bookImage,
                                            width: 130,
                                            height: 180,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          successState.bookList[index].bookName,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "\$${successState.bookList[index].bookPrice}",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromRGBO(
                                                74, 138, 196, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const CustomToprow(
                              title: "Best Vendors", content: "See all"),
                          SizedBox(
                            height: 80,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.vendorsList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            250, 250, 250, 1),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.asset(
                                      successState.vendorsList[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const CustomToprow(
                              title: "Authors", content: "See all"),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: successState.authorList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: 
                                  Container(
                                    margin: const EdgeInsets.only(right: 25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.asset(
                                            successState.authorList[index].authorImage,
                                            width: 80,
                                            height: 80,
                                          ),
                                        ),
                                        Text(
                                          successState.authorList[index].authorName,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          successState.authorList[index].authorType,
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
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