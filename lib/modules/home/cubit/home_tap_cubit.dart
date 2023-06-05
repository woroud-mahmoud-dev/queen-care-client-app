import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/category.dart';
part 'home_tap_state.dart';

class HomeTapCubit extends Cubit<HomeTapState> {
  HomeTapCubit() : super(HomeInitial());

  static HomeTapCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categoriesList = [];
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  getCategoryWithHttp() async {
    emit(GetCategoriesLoading());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "$baseUrl/category");

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
        }
      } catch (e) {
        emit(GetCategoriesError('Error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }
}
