import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/models/points_prize_model.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsInitial());
  static PointsCubit get(context) => BlocProvider.of(context);
  dynamic myPoints;
  List<String> myPointsPrizeList = [];
  Future<dynamic> getMyPoints() async {
    emit(GetMyPointsLoading());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/my_point");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
    });
    debugPrint(response.toString());

    if (response.statusCode == 200) {
      myPoints = response.body;
      debugPrint('myPHints$myPoints');

      emit(GetMyPointsLoaded(myPoints!));
    } else if (response.statusCode == 404) {
      emit(GetMyPointsError(error: 'Error'));
    } else if (response.statusCode == 500) {
      // emit(GetMyPointsError(error: 'Error'));
      debugPrint('500 Internal Server Error');
    }

    return myPoints;
  }

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<String>> getMyPointsPrize() async {
    emit(ReplaceMyPointsLoadingState());

    if (await connectionChecker.hasConnection) {
      try {
        var point = await getMyPoints();
        var data = await apiBaseHelper.post('redeem', {
          'point': '70',
        });
        myPointsPrizeList = MyPointsPrizeModel.fromJson(data).prize;

        debugPrint(myPointsPrizeList.toString());

        emit(ReplaceMyPointsSuccessState());

        return myPointsPrizeList;
      } catch (e) {
        emit(ReplaceMyPointsErrorState());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return myPointsPrizeList;
  }
}
