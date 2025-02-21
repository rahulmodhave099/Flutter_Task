import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_heaven/view/MyBag/mybag_screen.dart';
import 'package:book_heaven/view/Home/home_screen.dart';
import 'package:book_heaven/view/category_screen.dart';
import 'package:book_heaven/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'navbar_event.dart';
import 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitialState()) {
    on<OnNavbarTapEvent>(onNavbarTapEvent);
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  FutureOr<void> onNavbarTapEvent(
      OnNavbarTapEvent event, Emitter<NavbarState> emit) {
    emit(ChangeNavBarTapState(
        event.newIndex, _screens.elementAt(event.newIndex)));
  }
}
