import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:http/http.dart' as http;

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  int? genderGroupValue;
  DateTime? birthdayDateTime;
  final myService = MyService();
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  void selectBirthdayDateTime(DateTime time) {
    birthdayDateTime = time;

    emit(SelectBirthDayState());
  }

  void selectGender(int index) {
    genderGroupValue = index;
    visible = false;

    emit((SelectGenderState()));
  }

  bool visible = false;
  void check() {
    visible = true;
    emit(Cheeked());
  }

  late UserModel user;

  registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String gender,
    required String city,
    required String area,
    required String country,
    required String address,
    required String phone,
  }) async {
    emit(RegisterLoadinglState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/Register");
        debugPrint('birthday is');
        debugPrint(birthdayDateTime.toString());

        final response = await http.post(myUrl, body: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phone': phone,
          'password': password,
          'gender': gender,
          'city': city,
          'area': area,
          'country': country,
          'address': address,
          'birthday': birthdayDateTime.toString(),
          'fcm,': 'fcm',
        });

        debugPrint(response.statusCode.toString());
        var data = json.decode(response.body);

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          UserModel user = userModelFromJson(response.body);
          debugPrint(user.firstName);
          debugPrint(user.email);
          debugPrint(user.phone);
          debugPrint(user.lastName);
          debugPrint(user.toString());
          debugPrint(user.apiToken);
          CacheHelper.saveData(key: 'name', value: user.firstName);
          CacheHelper.saveData(key: 'RoleId', value: user.roleId);
          CacheHelper.saveData(key: 'address', value: user.address);
          CacheHelper.saveData(key: 'email', value: user.email);
          CacheHelper.saveData(key: 'api_token', value: user.apiToken);
          CacheHelper.saveData(key: 'type', value: user.type);


          emit(RegisterSuccessState(user: user));
        } else if (response.statusCode == 403) {
          emit(NumberUsedState(error: data['body']));
        } else if (response.statusCode == 404) {
          emit(RegisterErrorState(error: data['body']));
        }
      } catch (e) {
        emit(ErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
  }
}
