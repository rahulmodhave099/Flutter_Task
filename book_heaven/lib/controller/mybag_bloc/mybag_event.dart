import 'package:book_heaven/model/book_model.dart';

abstract class MybagEvent {}

class OnMyBagInitialEvent extends MybagEvent {}

class OnMyBagRemoveBookEvent extends MybagEvent {
  final Book book;
  OnMyBagRemoveBookEvent({required this.book});
}

class OnIncreBookCountEvent extends MybagEvent {
  final Book book;

  OnIncreBookCountEvent({required this.book});
}

class OnDecreBookCountEvent extends MybagEvent {
  final Book book;

  OnDecreBookCountEvent({required this.book});
}
