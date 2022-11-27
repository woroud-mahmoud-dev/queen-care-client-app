
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
  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String gender,
  }){
    emit(RegisterLoadinglState());
    DioHelper.postData(url: register, data: {
      'name':name,
      'phone':phone,
      'email':email,
      'password':password,
      'gender':gender,
    }).then((value)     {
      print(value?.data.toString());
      print(jsonEncode(value?.data));
      user =UserModel.fromJson(value?.data) ;
      print(user.name);
      print(user.email);
      print(user.phone);
      print(value?.data);
      CacheHelper.saveData(key: 'name', value: user.name);
      CacheHelper.saveData(key: 'email', value: user.email);
      CacheHelper.saveData(key: 'api_token', value: user.api_token);
            emit(RegisterSuccessState(user:user ));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error: error.toString()));
    });
  }





  registerUser(
      {required String name,
        required String email,
        required String password,
        required String phone,
        required String gender,
     }) async {
    emit(RegisterLoadinglState());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/register");


    final response = await http.post(myUrl, body: {
      "name": name,
      "email": email,
      "password": password,
      'phone': phone,
      'gender': gender,

    });


    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
      UserModel user = UserModel.fromJson(data);
      print('data : ${data["api_token"]}');
      print(user.name);
      print(user.email);
      print(user.phone);    print(user.name);
      print(user.toString());
      print(user.api_token);
      CacheHelper.saveData(key: 'name', value: user.name);
      CacheHelper.saveData(key: 'email', value: user.email);
      CacheHelper.saveData(key: 'api_token', value: user.api_token);
      status = true;
      emit(RegisterSuccessState(user: user));
    } else if (response.statusCode == 404) {
      emit(RegisterErrorState(error: response.toString()));
      status = false;
    }
    return status;
  }}
