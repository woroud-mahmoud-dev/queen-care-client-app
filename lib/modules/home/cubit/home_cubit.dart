import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/auth/pages/profile/profile.dart';
import 'package:queen_care/modules/home/favorite_tap.dart';
import 'package:queen_care/modules/home/home_tap.dart';
import 'package:queen_care/modules/home/offers_tap.dart';
import 'package:queen_care/network/remote/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int current_index = 0;

  List<BottomNavigationBarItem> bottom_nav_items = [

    BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
        label: 'الرئيسية'),


    BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined),
        label: 'العروض'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
        label: 'المفضلة'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),
        label: 'الحساب '),


  ];

  void change_nav_index(int index) {
    current_index = index;
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    HomeTap(),
    Offer(),
    Favorite(),
    Profile(),
  ];


  List<Category> categories_list = [];

getCategoryWithHttp(
     ) async {
    emit(GetCategoriesLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/category");


    final response = await http.get(myUrl);


    List<dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
       categories_list = data
          .map(
            (dynamic item) => Category.fromJson(item),
      )
          .toList();

      emit(GetCategoriesSuccess(categoriesList: categories_list));
    } else if (response.statusCode == 404) {
      emit(GetCategoriesError('Error'));
    }
  }

  }
