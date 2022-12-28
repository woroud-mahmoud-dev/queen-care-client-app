
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/end_points.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/network/local/chach_helper.dart';
import 'package:queen_care/network/remote/dio_helper.dart';
import 'package:http/http.dart' as http;
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
var status;
  int? genderGroupValue;
  DateTime  birthdayDateTime =DateTime.now() ;
  void selectBirthdayDateTime(DateTime time) {
    birthdayDateTime =time;
    emit(SelectBirthDayState());
  }
  void selectgender(int index) {
    genderGroupValue = index;
    visible = false;

    emit((SelectGenderState()));
  }

  bool visible = false;
  void Check() {
    visible = true;
    emit(Cheeked());
  }

 late  UserModel user;
  // void userRegister({
  //   required String firstName,
  //   required String lastName,
  //
  //   required String email,
  //   required String password,
  //   required String gender,
  //   required String city,
  //   required String area,
  //   required String country,
  //   required String address,
  //   // required String role_id,
  //   // required String fcm,
  //   required String phone,
  //   required DateTime birthday,
  //
  //
  //
  // }){
  //   emit(RegisterLoadinglState());
  //   DioHelper.postData(url: register, data: {
  //     'firstName':firstName,
  //     'lastName':lastName,
  //     'email':email,
  //
  //     'password':password,
  //     'gender':gender,
  //     'city':city,
  //     'area':area,
  //     'country':country,
  //     'address':address,
  //     'birthday':birthday,
  //     'role_id':'2',
  //     'fcm,':'qwertyuio',
  //   }).then((value)     {
  //     print(value?.data.toString());
  //     print(jsonEncode(value?.data));
  //     user =UserModel.fromJson(value?.data) ;
  //     print(user.firstName);
  //     print(user.email);
  //     print(user.phone);
  //     print(value?.data);
  //     CacheHelper.saveData(key: 'name', value: user.firstName);
  //     CacheHelper.saveData(key: 'email', value: user.email);
  //     CacheHelper.saveData(key: 'api_token', value: user.apiToken);
  //           emit(RegisterSuccessState(user:user ));
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(RegisterErrorState(error: error.toString()));
  //   });
//  }





  registerUser(
      {    required String firstName,
        required String lastName,

        required String email,
        required String password,
        required String gender,
        required String city,
        required String area,
        required String country,
        required String address,
        // required String role_id,
        // required String fcm,
        required String phone,
        // required DateTime birthday,
     }) async {
    emit(RegisterLoadinglState());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/Register");


    final response = await http.post(myUrl, body: {
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'phone':phone,

      'password':password,
      'gender':gender,
      'city':city,
      'area':area,
      'country':country,
      'address':address,
      'birthday':DateTime.now().toString(),
      'role_id':'2',
      'fcm,':'qwertyuio',

    });

    print(response.statusCode);

    // var data = userModelFromJson(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
      UserModel user = userModelFromJson(response.body);
      print('data : ${user.apiToken}');
      print(user.firstName);
      print(user.email);
      print(user.phone);    print(user.lastName);
      print(user.toString());
      print(user.apiToken);
      CacheHelper.saveData(key: 'name', value: user.firstName);
      CacheHelper.saveData(key: 'email', value: user.email);
      CacheHelper.saveData(key: 'api_token', value: user.apiToken);
      status = true;
      emit(RegisterSuccessState(user: user));
    } else if (response.statusCode == 404) {
      emit(RegisterErrorState(error: response.toString()));
    }
  }}
