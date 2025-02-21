// part of 'home_bloc.dart';

// @immutable

import 'package:book_heaven/model/author_model.dart';
import 'package:book_heaven/model/book_model.dart';

abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<Book> bookList;
  final List vendorsList;
  final List<Author> authorList;
  HomeLoadedSuccessState({
    required this.bookList,
    required this.vendorsList,
    required this.authorList,
  });
}

class HomeToBookDetailsActionState extends HomeActionState {
  final Book book;
  HomeToBookDetailsActionState({
    required this.book,
  });
}

class BookUpdatedState extends HomeState {
  final Book book;
  BookUpdatedState({required this.book});
}

class HomeBookAddedBagActionState extends HomeActionState {
  final String message;

  HomeBookAddedBagActionState({required this.message});
}
