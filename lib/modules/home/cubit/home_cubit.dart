import 'package:bloc/bloc.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/models/category.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  static HomeCubit get(context) => BlocProvider.of(context);




  List<CategoryModel> categories_list = [];

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
            (dynamic item) => CategoryModel.fromJson(item),
      )
          .toList();

      emit(GetCategoriesSuccess(categoriesList: categories_list));
    } else if (response.statusCode == 404) {
      emit(GetCategoriesError('Error'));
    }
  }

  }
