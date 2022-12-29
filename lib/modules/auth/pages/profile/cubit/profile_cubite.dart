
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';
import 'package:queen_care/network/local/chach_helper.dart';

import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  int? genderGroupValue;
  UserModel? user;

  getProfileWithHttp(
      ) async {
    emit(GetProfileLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/profile");


    final response = await http.post(myUrl, body: {
      'token':CacheHelper.getData(key: 'api_token'),



    });


    var data = json.decode(response.body);

    if (response.statusCode == 200) {


      debugPrint(response.statusCode.toString());
      user = UserModel.fromJson(data);
      genderGroupValue =int.parse(user!.gender);
      debugPrint('data : ${data["api_token"]}');
      debugPrint(user!.birthday.toString());

      emit(GetProfileLoaded(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }


  void selectgender(int index) {
    genderGroupValue = index;


    emit((SelectGenderState()));
  }

  DateTime? birthdayDateTime;
  MyService myService = MyService();

  void selectBirthdayDateTime(DateTime time) {
    birthdayDateTime = time;

    emit(SelectBirthDayState());
  }

  editeProfileWithHttp(
  {
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String gender,
    required String city,
    required String area,
    required String country,
    required String address,


}
      ) async {
    emit(EditeProfileLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/update-profile");


    final response = await http.post(myUrl, body: {
      'token':CacheHelper.getData(key: 'api_token'),
      'firstName':firstName.isEmpty?user!.firstName:firstName,
      'lastName':lastName.isEmpty?user!.lastName:lastName,
      'phone':phone.isEmpty?user!.phone:phone,
      'email':email.isEmpty?user!.email:email,
      'gender':gender.isEmpty?user!.gender:gender,



      'city': city.isEmpty?user!.city:city,
      'area': area.isEmpty?user!.area:area,
      'country': country.isEmpty?user!.country:country,
      'address': address.isEmpty?user!.address:address,
      'birthday': birthdayDateTime.toString()=='null'?user!.birthday.toString():birthdayDateTime.toString(),



    });


    var data = json.decode(response.body);
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {

      user = UserModel.fromJson(data);
      debugPrint('data : ${data["api_token"]}');
      debugPrint('update user done !!!');

      emit(EditeProfileSuccess(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }
}
