import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/models/prize_model.dart';

import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

part 'awards_state.dart';

class AwardsCubit extends Cubit<AwardsState> {
  AwardsCubit() : super(AwardsInitial());
  static AwardsCubit get(context) => BlocProvider.of(context);

  List<CompetitionPrize> myPrizes = [];
  List<PointsPrize> myPointsPrizes = [];

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();

  Future<List<CompetitionPrize>?> getMyPrizes() async {
    emit(GetMyPrizesLoadingState());

    if (await connectionChecker.hasConnection) {
      try {
        var data = await apiBaseHelper.post('my_prize', {
          'token': CacheHelper.getData(key: 'api_token'),
        });
        var allData = MyPrizesModel.fromJson(data);
        myPrizes = allData.competitionPrize
            .map((e) => CompetitionPrize(
                id: e.id,
                userId: e.userId,
                quizId: e.quizId,
                result: e.result,
                prize: e.prize,
                createdAt: e.createdAt,
                updatedAt: e.updatedAt))
            .toList();
        myPointsPrizes=allData.pointsPrize
            .map((e) => PointsPrize(
            id: e.id,
            userId: e.userId,

            prize: e.prize,
            createdAt: e.createdAt,
            updatedAt: e.updatedAt))
            .toList();
        debugPrint(myPrizes.toString());

        emit(GetMyPrizesSuccessState(
          myPrizes: myPrizes,
        ));

        return myPrizes;
      } catch (e) {
        emit(GetMyPrizesErrorState(error: 'error'));
      }
    } else {
      emit(DeviceNotConnectedState());
    }
    return myPrizes;
  }
}
