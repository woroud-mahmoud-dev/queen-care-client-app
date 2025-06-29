import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/points_prize_model.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsInitial());
  static PointsCubit get(context) => BlocProvider.of(context);
  dynamic myPoints;
  List<String> myPointsPrizeList = [];

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  Future<dynamic> getMyPoints() async {
    emit(GetMyPointsLoading());

    try {
      var myUrl = Uri.parse("$baseUrl/my_point");

      final response = await http.post(myUrl, body: {
        'token': CacheHelper.getData(key: 'api_token'),
      });
      debugPrint(response.toString());

      if (response.statusCode == 200) {
        myPoints = response.body;

        debugPrint('myPHints$myPoints');
        debugPrint(myPoints.runtimeType.toString());

        emit(GetMyPointsLoaded(myPoints!));
      } else if (response.statusCode == 404) {
        emit(GetMyPointsError(error: 'Error'));
      } else if (response.statusCode == 500) {
        // emit(GetMyPointsError(error: 'Error'));
        debugPrint('500 Internal Server Error');
      }
    } catch (e) {
      emit(GetMyPointsError(error: 'Error:$e'));
    }
    if (await connectionChecker.hasConnection) {
    } else {
      emit(DeviceNotConnectedState());
    }

    return myPoints;
  }

  Future<List<String>> getMyPointsPrize() async {
    emit(GetMyPointsPrizeLoadingState());

    if (await connectionChecker.hasConnection) {
      try {
        var point = await getMyPoints();
        var data = await apiBaseHelper.post('redeem', {
          'point': point.toString().isEmpty ? "0" : point,
        });
        myPointsPrizeList = MyPointsPrizeModel.fromJson(data).prize;

        debugPrint(myPointsPrizeList.toString());

        emit(GetMyPointsPrizeSuccessState());

        return myPointsPrizeList;
      } catch (e) {
        emit(GetMyPointsPrizeErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return myPointsPrizeList;
  }

  Future<void> replacePointWithPrize({required String prize}) async {
    emit(ReplacePointLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/prize_point");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'prize': prize,
        });
        print(response.statusCode);
        if (response.statusCode == 200) {
          emit(ReplacePointSuccessState());
        } else if (response.statusCode == 404) {
          emit(ReplacePointErrorState());
        }
      } catch (e) {
        emit(ReplacePointErrorState());
      }
    } else {
      emit(NotInternetToReplaceState());
    }
  }
}
