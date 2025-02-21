import 'package:book_heaven/model/author_model.dart';
import 'package:book_heaven/model/book_model.dart';

///ADD TO CART LIST
List<Book> cartList = [];

///Vendors List
List vendorsList = [
  "assets/images/group1.png",
  "assets/images/group2.png",
  "assets/images/group3.png",
  "assets/images/group4.png",
];

///BOOKS LIST
List<Book> bookList = [
  Book(
      bookImage: "assets/images/kite.png",
      bookName: "The Kite Runner",
      bookPrice: 14.99,
      quantity: 1,
      isFev: false,
      description:
          "The boys' childhood in Kabul, Baba and Amir's emigration to the U.S., and Amir's rescue mission in Afghanistan.",
      vendor: "assets/images/vendor1.png"),
  Book(
      bookImage: "assets/images/carrie_fisher.png",
      bookName: "Carrie Fisher",
      bookPrice: 20.99,
      quantity: 1,
      isFev: false,
      description:
          "Carrie Fisher was an American actress, screenwriter and author, most famous for her portrayal of Princess Leia in the original Star Wars trilogy.",
      vendor: "assets/images/vendor2.png"),
  Book(
      bookImage: "assets/images/bright_young.png",
      bookName: "Bright Young",
      bookPrice: 15.99,
      quantity: 1,
      isFev: false,
      description:
          "Bright Young Women is a fearless and intoxicating ride into the aftershocks of a series of brutal murders.",
      vendor: "assets/images/vendor3.png")
];

///Author List
List<Author> authorList = [
  const Author(
      authorImage: "assets/images/john.png",
      authorName: "John Freeman",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/tess.png",
      authorName: "Tess Gunty",
      authorType: "Novelist"),
  const Author(
      authorImage: "assets/images/richard.png",
      authorName: "Richard Perston",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/john.png",
      authorName: "John Freeman",
      authorType: "Writer"),
  const Author(
      authorImage: "assets/images/tess.png",
      authorName: "Tess Gunty",
      authorType: "Novelist"),
  const Author(
      authorImage: "assets/images/richard.png",
      authorName: "Richard Perston",
      authorType: "Writer"),
];
