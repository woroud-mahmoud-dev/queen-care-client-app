import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/models/category.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categoriesList = [];

  getCategoryWithHttp() async {
    emit(GetCategoriesLoading());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/category");

    final response = await http.get(myUrl);

    List<dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      categoriesList = data
          .map(
            (dynamic item) => CategoryModel.fromJson(item),
          )
          .toList();

      emit(GetCategoriesSuccess(categoriesList: categoriesList));
    } else if (response.statusCode == 404) {
      emit(GetCategoriesError('Error'));
    }
  }
}
