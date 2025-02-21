import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:book_heaven/controller/data/item.dart';
import 'package:book_heaven/controller/home_bloc/home_event.dart';
import 'package:book_heaven/controller/home_bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnHomeInitialEvent>(onHomeInitialEvent);

    on<OnHomeAddToCartButtonEvent>(onHomeAddToCartButtonEvent);

    on<OnBookDetailEvent>(onBookDetailEvent);
    on<OnIncreProductEvent>(onIncreProductEvent);
    on<OnDecreProductEvent>(onDecreProductEvent);
    on<OnFavouriteEvent>(onFavouriteEvent);
  }

  FutureOr<void> onHomeInitialEvent(
      OnHomeInitialEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());

    emit(HomeLoadedSuccessState(
        bookList: bookList, vendorsList: vendorsList, authorList: authorList));
  }

  FutureOr<void> onBookDetailEvent(
      OnBookDetailEvent event, Emitter<HomeState> emit) {
    emit(HomeToBookDetailsActionState(book: event.clickedBook));
  }

  FutureOr<void> onFavouriteEvent(
      OnFavouriteEvent event, Emitter<HomeState> emit) {
    event.book.isFev = !event.book.isFev;
    emit(BookUpdatedState(book: event.book));
  }

  FutureOr<void> onIncreProductEvent(
      OnIncreProductEvent event, Emitter<HomeState> emit) {
    log("Incrementing product count for ${event.book.bookName}");

    event.book.quantity += 1;
    emit(BookUpdatedState(book: event.book));
  }

  FutureOr<void> onDecreProductEvent(
      OnDecreProductEvent event, Emitter<HomeState> emit) {
    log("Decrementing product count for ${event.book.bookName}");

    if (event.book.quantity > 1) {
      // Update the product's `quantity`
      event.book.quantity -= 1;

      // Emit a state to refresh the cart view
      emit(BookUpdatedState(book: event.book));
    } else {
      log("Cannot decrement below 1");
    }
  }

  FutureOr<void> onHomeAddToCartButtonEvent(
      OnHomeAddToCartButtonEvent event, Emitter<HomeState> emit) {
    log("${event.clickedBook.bookName} added in bag");
    if (cartList.contains(event.clickedBook)) {
      emit(HomeBookAddedBagActionState(
          message: "${event.clickedBook.bookName} already added in bag"));
    } else {
      cartList.add(event.clickedBook);
      emit(HomeBookAddedBagActionState(
          message: "${event.clickedBook.bookName} added in bag"));
    }
  }
}
