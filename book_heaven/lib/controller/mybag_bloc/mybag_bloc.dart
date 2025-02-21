import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:book_heaven/controller/mybag_bloc/mybag_event.dart';
import 'package:book_heaven/controller/mybag_bloc/mybag_state.dart';
import 'package:book_heaven/controller/data/item.dart';

class MyBagBloc extends Bloc<MybagEvent, MyBagState> {
  MyBagBloc() : super(MyBagInitialState()) {
    on<OnMyBagInitialEvent>(onMyBagInitialEvent);
    on<OnMyBagRemoveBookEvent>(onMyBagRemoveBookEvent);
    on<OnIncreBookCountEvent>(onIncreBookCountEvent);
    on<OnDecreBookCountEvent>(onDecreBookCountEvent);
  }
  FutureOr<void> onMyBagInitialEvent(
      OnMyBagInitialEvent event, Emitter<MyBagState> emit) async {

    emit(MyBagLoadingState());

    emit(MyBagDataState(cartList: cartList));
  }

  FutureOr<void> onMyBagRemoveBookEvent(
      OnMyBagRemoveBookEvent event, Emitter<MyBagState> emit) async {
    cartList.remove(event.book);

    ///To show List after removing items from cart
    emit(MyBagDataState(cartList: cartList));

    emit(MyBagRemoveProductActionState(
        message: "${event.book.bookName} removed from Cart"));
  }

  FutureOr<void> onIncreBookCountEvent(
      OnIncreBookCountEvent event, Emitter<MyBagState> emit) {

    event.book.quantity += 1;

    // Emit a state to refresh the cart view
    emit(MyBagDataState(cartList: cartList));
  }

  FutureOr<void> onDecreBookCountEvent(
      OnDecreBookCountEvent event, Emitter<MyBagState> emit) {

    if (event.book.quantity > 1) {
      event.book.quantity -= 1;

      // Emit a state to refresh the cart view
      emit(MyBagDataState(cartList: cartList));
    } else {
    }
  }
}
