
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';
import 'package:queen_care/network/local/chach_helper.dart';
import 'package:queen_care/network/remote/dio_helper.dart';

import 'package:http/http.dart' as http;
// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(ProfileInitialState());
//
//   static ProfileCubit get(context) => BlocProvider.of(context);
//    UserModel ?profile ;
//
//   void getProfileWithDio({
//     required String token,
//   }){
//     emit(ProfileLoadingState());
//     DioHelper.postData(url: 'profile', data: {
//       'token':token,
//     }).then((value)     {
//
//
//
//       emit(ProfileSuccessState( profile!));
//     }).catchError((error){
//       print(error.toString());
//       emit(ProfileErrorState(error: ''));
//     });
//   }
//   getProfileWithHttp(
//      ) async {
//     emit(ProfileLoadingState());
//     var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/profile");
//
//
//     final response = await http.post(myUrl, body: {
//       'token':CacheHelper.getData(key: 'api_token'),
//
//
//
//     });
//
//
//     var data = json.decode(response.body);
//
//     if (response.statusCode == 200) {
//
//       print(response.statusCode);
//       UserModel user = UserModel.fromJson(data);
//       print('data : ${data["api_token"]}');
//
//       emit(ProfileSuccessState( user));
//     } else if (response.statusCode == 404) {
//       emit(ProfileErrorState(error: 'Error'));
//     }
//
//   }
// }
class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);

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
      print('data : ${data["api_token"]}');

      emit(GetProfileLoaded(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }

  editeProfileWithHttp(
  {
    required String name,
    required String phone,
    required String email,
    required String password,

}
      ) async {
    emit(EditeProfileLoading());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/profile");


    final response = await http.post(myUrl, body: {
      'token':CacheHelper.getData(key: 'api_token'),
      'name':name.isEmpty?user!.name:name,
      'phone':phone.isEmpty?user!.phone:phone,
      'email':email.isEmpty?user!.email:email,






    });


    var data = json.decode(response.body);

    if (response.statusCode == 200) {

      print(response.statusCode);
      user = UserModel.fromJson(data);
      print('data : ${data["api_token"]}');

      emit(GetProfileLoaded(user! ));
    } else if (response.statusCode == 404) {
      emit(GetProfileError(error: 'Error'));
    }

  }
}
