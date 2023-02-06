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

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  // Future<List<PrizeModel>> getMyPrizes() async {
  //   emit(GetMyPrizesLoadingState());
  //
  //   var myUrl =
  //       Uri.parse("https://karam-app.com/celo/queencare/public/api/my_prize");
  //
  //   final response = await http.post(myUrl, body: {
  //     'token': CacheHelper.getData(key: 'api_token'),
  //   });
  //   debugPrint(response.statusCode.toString());
  //
  //   if (response.statusCode == 200) {
  //     myPrizes = prizeModelListFromJson(response.body);
  //     debugPrint(myPrizes.toString());
  //     debugPrint(myPrizes.length.toString());
  //
  //     emit(GetMyPrizesSuccessState(
  //       myPrizes: myPrizes,
  //     ));
  //   } else if (response.statusCode == 404) {
  //     emit(GetMyPrizesErrorState(error: 'error'));
  //   }
  //   return myPrizes;
  // }

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
