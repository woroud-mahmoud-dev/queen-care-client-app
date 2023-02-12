import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/competition.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/models/points_result_model.dart';
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/models/profile.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

part 'competition_state.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  CompetitionCubit() : super(OffersInitial());
  static CompetitionCubit get(context) => BlocProvider.of(context);
  MyService myService = MyService();
  PrizeModel? prizeModel;
  PointsModel? pointsModel;
  int currentStep = 1;
  int correct = 0;
  bool? complete;
  int indexQ = 0;
  String? answerGroupValue;
  List<Competition> allCompetitionsList = [];
  List<Question> questionsList = [];
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  final apiBaseHelper = ApiBaseHelper();
  Future<List<Competition>> getAllCompetitions() async {
    emit(GetAllCompetitionsLoadingState());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/quiz");

        final response = await http.get(myUrl);

        if (response.statusCode == 200) {
          allCompetitionsList = competitionFromJson(response.body);
          emit(GetAllCompetitionsSuccessState(
              allCompetitionsLis: allCompetitionsList));
        }
      } catch (e) {
        emit(GetAllCompetitionsErrorState(error: 'error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return allCompetitionsList;
    }

    return allCompetitionsList;
  }

  Future<List<Question>> getQuestions() async {
    emit(GetAllQuestionsLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/Question");

        final response = await http.post(myUrl, body: {
          "id": myService.getSelectedComp!.id.toString(),
        });

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          questionsList = questionFromJson(response.body);
          debugPrint(questionsList.toString());
          debugPrint(questionsList.length.toString());

          emit(GetAllQuestionsSuccessState(questionsList: questionsList));
        } else if (response.statusCode == 404) {
          emit(GetAllQuestionsErrorState(error: 'error'));
        }
      } catch (e) {
        emit(GetAllQuestionsErrorState(error: e.toString()));
      }
    } else {
      emit(DeviceNotConnectedState());
    }

    return questionsList;
  }

  Future<PrizeModel?> getCompetitionPrize(var result) async {
    emit(SendResultStateLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/prize");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          "quiz": myService.getSelectedComp!.id.toString(),
          "prize": myService.getSelectedComp!.prize,
          "result": result.toString(),
        });
        debugPrint(response.body.toString());

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          prizeModel = prizeModelFromJson(response.body);
          debugPrint(prizeModel.toString());
          debugPrint(questionsList.length.toString());

          emit(FinishStateWithWin(prizeModel!));
        } else if (response.statusCode == 404) {
          emit(GetResultErrorState(error: 'error'));
        }
      } catch (e) {
        emit(GetResultErrorState(error: '$e'));
      }
    } else {
      emit(DeviceNotConnectedState());
    }


    return prizeModel;
  }

  Future<PointsModel?> getCompetitionPoints(var result) async {
    emit(SendResultStateLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/prize");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          "quiz": myService.getSelectedComp!.id.toString(),
          "prize": myService.getSelectedComp!.prize,
          "result": result.toString(),
        });
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          pointsModel = pointsModelFromJson(response.body);
          debugPrint('the points has :${pointsModel!.result}');

          emit(FinishStateWithLoss(pointsModel!.result));
        } else if (response.statusCode == 404) {
          emit(GetResultErrorState(error: 'error'));
        }
      } catch (e) {
        emit(GetResultErrorState(error: e.toString()));
      }
    } else {
      emit(DeviceNotConnectedState());
    }

    return pointsModel;
  }

  void selectAnswer({required String answer, required String result}) {
    answerGroupValue = answer;
    debugPrint('answer is : $answer');
    debugPrint('result is : $result');
    debugPrint(
        {answer.trim().toString() == result.trim().toString()}.toString());
    if (answer.trim().toString() == result.trim().toString()) {
      correct = correct + 1;
      emit((SelectCorrectAnswerState()));
    } else {
      emit(SelectWrongAnswerState());
    }
  }

  void onPressNext() async {
    if (answerGroupValue != null) {
      if (indexQ + 1 == questionsList.length) {
        debugPrint('correct is $correct');
        debugPrint('correct is $correct');
        debugPrint('questionsList 80% is ${questionsList.length * (80 / 100)}');
        debugPrint('IS winner ${correct >= questionsList.length * (80 / 100)}');
        var res = (correct / questionsList.length) * 100;
        if (await connectionChecker.hasConnection) {
          try {
            if (correct >= questionsList.length * (80 / 100)) {
              debugPrint(res.toString());
              getCompetitionPrize(res);
            } else {
              getCompetitionPoints(res);
            }
          } catch (e) {
            emit(GetResultErrorState(error: e.toString()));
          }
        } else {
          emit(DeviceNotConnectedToSendResultState());
        }
      } else {
        indexQ = indexQ + 1;
        next();
        answerGroupValue = null;
        emit((GoNextStep()));
      }
    } else {
      showToast(text: 'عليك الاختيار اولا', color: darkGrey2);
    }
  }

  void next() {
    if (currentStep <= questionsList.length) {
      goTo(currentStep + 1);
    }
  }

  void goTo(int step) {
    currentStep = step;
    emit(GoNextStep());
    if (currentStep > questionsList.length) {
      complete = true;
      emit(CompleteState());
    }
  }
}
// if (await connectionChecker.hasConnection) {
// try{}catch(e){}
// }else{
// emit(DeviceNotConnectedState());
// }
