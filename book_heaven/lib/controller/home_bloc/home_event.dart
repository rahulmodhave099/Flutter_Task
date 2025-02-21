import 'package:book_heaven/model/book_model.dart';

abstract class HomeEvent {}

class OnHomeInitialEvent extends HomeEvent {}

class OnHomeAddToCartButtonEvent extends HomeEvent {
  final Book clickedBook;
  OnHomeAddToCartButtonEvent({
    required this.clickedBook,
  });
}

class OnIncreProductEvent extends HomeEvent {
  final Book book;

  OnIncreProductEvent({required this.book});
}

class OnDecreProductEvent extends HomeEvent {
  final Book book;

  OnDecreProductEvent({required this.book});
}

class OnFavouriteEvent extends HomeEvent {
  final Book book;
  OnFavouriteEvent({required this.book});
}

class OnBookDetailEvent extends HomeEvent {
  final Book clickedBook;
  OnBookDetailEvent({
    required this.clickedBook,
  });
}
