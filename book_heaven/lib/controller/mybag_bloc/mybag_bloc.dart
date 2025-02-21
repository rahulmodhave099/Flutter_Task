import 'dart:async';
import 'dart:developer';

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
    log('Emit CartLoadingState');

    emit(MyBagLoadingState());
    log('pause');

    log('Emit CartLoadedSuccessState');

    emit(MyBagDataState(cartList: cartList));
  }

  FutureOr<void> onMyBagRemoveBookEvent(
      OnMyBagRemoveBookEvent event, Emitter<MyBagState> emit) async {
    log('Remove Product from cart');
    cartList.remove(event.book);

    ///To show List after removing items from cart
    emit(MyBagDataState(cartList: cartList));

    emit(MyBagRemoveProductActionState(
        message: "${event.book.bookName} removed from Cart"));
  }

  FutureOr<void> onIncreBookCountEvent(
      OnIncreBookCountEvent event, Emitter<MyBagState> emit) {
    log("Incrementing product count for ${event.book.bookName}");

    // Update the product's `numberOfItems`
    event.book.quantity += 1;

    // Emit a state to refresh the cart view
    emit(MyBagDataState(cartList: cartList));
  }

  FutureOr<void> onDecreBookCountEvent(
      OnDecreBookCountEvent event, Emitter<MyBagState> emit) {
    log("Decrementing product count for ${event.book.bookName}");

    if (event.book.quantity > 1) {
      // Update the product's `numberOfItems`
      event.book.quantity -= 1;

      // Emit a state to refresh the cart view
      emit(MyBagDataState(cartList: cartList));
    } else {
      log("Cannot decrement below 1");
    }
  }
}
