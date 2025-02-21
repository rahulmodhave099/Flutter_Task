import 'package:book_heaven/model/book_model.dart';

abstract class MyBagState {}

class MyBagActionState extends MyBagState {}

class MyBagInitialState extends MyBagState {}

class MyBagLoadingState extends MyBagState {}

class MyBagDataState extends MyBagState {
  final List<Book> cartList;
  MyBagDataState({
    required this.cartList,
  });
}

class MyBagRemoveProductActionState extends MyBagActionState {
  final String message;

  MyBagRemoveProductActionState({required this.message});
}
