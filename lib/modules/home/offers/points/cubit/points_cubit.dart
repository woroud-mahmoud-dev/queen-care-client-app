
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/chach_helper.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsInitial());
  static PointsCubit get(context) => BlocProvider.of(context);
 dynamic myPoints;

  getMyPoints() async {
    emit(GetMyPointsLoading());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/my_point");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
    });

    if (response.statusCode == 200) {
      myPoints = response.body ;
      debugPrint('myPHints$myPoints');

      emit(GetMyPointsLoaded(myPoints!));
    } else if (response.statusCode == 404) {
      emit(GetMyPointsError(error: 'Error'));
    }
  }
}
