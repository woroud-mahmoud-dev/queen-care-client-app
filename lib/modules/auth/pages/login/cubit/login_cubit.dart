import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_states.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  static LoginCubit get(context) => BlocProvider.of(context);
  late UserModel user;
  bool rememberMe = false;
  void remember() {
    rememberMe = !rememberMe;
    CacheHelper.saveData(key: RememberMe, value: rememberMe);
    emit(ChangeRememberMeState());
  }

  Future<UserModel?> login({
    required String password,
    required String phone,
  }) async {
    emit(LoginLoadingState());

    if (await connectionChecker.hasConnection) {
      try {
        var data = await apiBaseHelper.post('login', {
          'phone': phone,
          "password": password,
        });
        UserModel user = UserModel.fromJson(data);
        CacheHelper.saveData(key: 'RoleId', value: user.roleId);

        CacheHelper.saveData(key: 'address', value: user.address);
        CacheHelper.saveData(key: 'api_token', value: user.apiToken);
        CacheHelper.saveData(key: 'type', value: user.type);
        emit(LoginSuccessState(user: user));

        return user;
      } catch (e) {
        emit(LoginErrorState(error: e.toString()));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
    return null;
  }

  loginWithHttp({
    required String password,
    required String phone,
  }) async {
    emit(LoginLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/login");

        final response = await http.post(myUrl, body: {
          'phone': phone,
          "password": password,
        });

        var data = json.decode(response.body);
        debugPrint(response.body);

        if (response.statusCode == 200) {
          UserModel user = UserModel.fromJson(data);
          CacheHelper.saveData(key: 'address', value: user.address);

          CacheHelper.saveData(key: 'name', value: user.firstName);
          CacheHelper.saveData(key: 'email', value: user.email);
          CacheHelper.saveData(key: 'api_token', value: user.apiToken);
          CacheHelper.saveData(key: 'type', value: user.type);

          debugPrint(CacheHelper.getData(key: 'type'));
          if (user.roleId != '2') {
            emit(UserDataInvalid());
          } else {
            emit(LoginSuccessState(user: user));
          }
        } else if (response.statusCode == 404) {
          emit(LoginErrorState(error: 'Error'));
        }
      } catch (e) {
        emit(LoginErrorState(error: 'Error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }
}
