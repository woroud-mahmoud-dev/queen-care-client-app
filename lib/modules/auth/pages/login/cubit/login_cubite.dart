
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/end_points.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_states.dart';
import 'package:queen_care/network/local/chach_helper.dart';
import 'package:queen_care/network/remote/dio_helper.dart';



class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  late UserModel user ;
bool rememberMe =false;
  void remember() {
    rememberMe = !rememberMe;
    CacheHelper.saveData(key: RememberMe, value: rememberMe);
emit(ChangeRememberMeState());
  }

  void UserLogin({
    required String phone,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {
      'phone':phone,
      'password':password,
    }).then((value)     {

      print(value!.data);

      user =UserModel.fromJson(value.data) ;

      CacheHelper.saveData(key: 'name', value: user.name);
      CacheHelper.saveData(key: 'email', value: user.email);
      CacheHelper.saveData(key: 'api_token', value: user.api_token);

      print(value.statusCode);

      emit(LoginSuccessState(user: user));
    }).catchError((error){
      print(error.toString());
      emit(LoginErrorState(error: ''));
    });
  }
  loginWithHttp(
      {
        required String password,
        required String phone,

      }) async {
    emit(LoginLoadingState());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/login");


    final response = await http.post(myUrl, body: {
      'phone': phone,
      "password": password,



    });


    var data = json.decode(response.body);

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
      emit(LoginSuccessState(user: user));
    } else if (response.statusCode == 404) {
      emit(LoginErrorState(error: 'Error'));
    }

  }
}
