
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';
import 'package:queen_care/network/local/chach_helper.dart';
import 'package:queen_care/network/remote/dio_helper.dart';

import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  int? genderGroupValue;
  UserModel? user;
  //
  // void getUser() {
  //   emit(GetProfileLoading());
  //   DioHelper.postData(url: profile, data: {
  //     'token': CacheHelper.getData(key: 'apiToken'),
  //   }).then((value) {
  //     print(value!.data);
  //     print(value.statusCode);
  //
  //     user = UserModel.fromMap(value.data);
  //
  //     emit(GetProfileLoaded(user!));
  //   }).catchError((error) {
  //     emit(GetProfileError(error: error.toString()));
  //   });
  // }
  getProfileWithHttp(
      ) async {
    emit(GetProfileLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/profile");


    final response = await http.post(myUrl, body: {
      'token':CacheHelper.getData(key: 'api_token'),



    });


    var data = json.decode(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
      user = UserModel.fromJson(data);
      genderGroupValue =int.parse(user!.gender);
          print('data : ${data["api_token"]}');

      emit(GetProfileLoaded(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }


  void selectgender(int index) {
    genderGroupValue = index;


    emit((SelectGenderState()));
  }
  editeProfileWithHttp(
  {
    required String name,
    required String phone,
    required String email,
    required String password,
    required String gender,

}
      ) async {
    emit(EditeProfileLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/update_profile");


    final response = await http.post(myUrl, body: {
      'token':CacheHelper.getData(key: 'api_token'),
      'name':name.isEmpty?user!.name:name,
      'phone':phone.isEmpty?user!.phone:phone,
      'email':email.isEmpty?user!.email:email,
      'gender':gender.isEmpty?user!.gender:gender,






    });


    var data = json.decode(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
      user = UserModel.fromJson(data);
      print('data : ${data["api_token"]}');
      print('update user done !!!');

      emit(EditeProfileSuccess(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }
}
