import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/competion.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/models/profile.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/network/local/chach_helper.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(OffersInitial());
  static OffersCubit get(context) => BlocProvider.of(context);
  MyService myService = MyService();
  List<Comptition> allCompetitionsList = [];
  Future<List<Comptition>> getAllCompetitions() async {
    emit(GetAllCompetitionsLoadingState());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/quiz");

    final response = await http.get(myUrl);

    if (response.statusCode == 200) {

      allCompetitionsList = competitionFromJson(response.body);
      debugPrint(allCompetitionsList.toString());
      debugPrint(allCompetitionsList.length.toString());

      emit(GetAllCompetitionsSuccessState(
        allCompetitionsLis: allCompetitionsList,
      ));
    } else if (response.statusCode == 404) {
      emit(GetAllCompetitionsErrorState(error: 'error'));
    }
    return allCompetitionsList;
  }

  List<Question> questionsList = [];
  Future<List<Question>> getQuestions() async {
    emit(GetAllQuestionsLoadingState());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/Question");

    final response = await http.post(myUrl, body: {
      "id": myService.getSelectedComp!.id.toString(),
    });

    if (response.statusCode == 200) {
      print(response.statusCode);
      questionsList = questionFromJson(response.body);
      debugPrint(questionsList.toString());
      debugPrint(questionsList.length.toString());

      emit(GetAllQuestionsSuccessState(questionsList: questionsList));
    } else if (response.statusCode == 404) {
      emit(GetAllQuestionsErrorState(error: 'error'));
    }
    return questionsList;
  }
  PrizeModel? prizeModel;
  ProfileModel? profileModel;
  Future<PrizeModel?> getCompetionPrize(var result) async {
    emit(SendResultStateLoading());
    var myUrl =
    Uri.parse("https://karam-app.com/celo/queencare/public/api/prize");

    final response = await http.post(myUrl, body: {
      "quiz": myService.getSelectedComp!.id.toString(),
      "prize": myService.getSelectedComp!.prize,
      "result": result.toString(),

    });
    debugPrint(response.body.toString());


    if (response.statusCode == 200) {
      print(response.statusCode);
      prizeModel = prizeModelFromJson(response.body);
      debugPrint(prizeModel.toString());
      debugPrint(questionsList.length.toString());

      emit(FinishStateWithWin( prizeModel!));
    } else if (response.statusCode == 404) {
      emit(GetResultErrorState(error: 'error'));
    }
    return prizeModel;
  }
  Future<ProfileModel?> getCompetitionPoints(var result) async {
    print(result);
    emit(SendResultStateLoading());
    var myUrl =
    Uri.parse("https://karam-app.com/celo/queencare/public/api/prize");

    final response = await http.post(myUrl, body: {
      "quiz": myService.getSelectedComp!.id.toString(),
      "prize": myService.getSelectedComp!.prize,
      "result": result.toString(),

    });
    print(response.statusCode);
    if (response.statusCode == 200) {

      profileModel = profileFromJson(response.body);
      debugPrint('the points has :${profileModel!.point}');

      emit(FinishStateWithLoss( double.parse(profileModel!.point)));
    } else if (response.statusCode == 404) {
      emit(GetResultErrorState(error: 'error'));
    }
    return profileModel;
  }

  int currentStep = 1;
  int correct = 0;
  bool? complete;
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






  int indexQ = 0;



  String? answerGroupValue;
  void selectAnswer({required String answer, required String result}) {
    answerGroupValue = answer;
    print('answer is : ${answer}');
    print('result is : ${result}');
    print(answer.trim().toString() == result.trim().toString());
    if (answer.trim().toString() == result.trim().toString()) {
      correct = correct + 1;
      emit((SelectCorrectAnswerState()));
    } else {
      emit(SelectWrongAnswerState());
    }
  }

  void onPressNext() {
    if (answerGroupValue != null) {
      if (indexQ + 1 == questionsList.length) {
        print('correct is ${correct}');
        print('correct is ${correct}');
        print('questionsList 80% is ${questionsList.length * (80 / 100)}');
        print('IS winner ${correct >= questionsList.length * (80 / 100)}');
        var res=(correct/questionsList.length)* 100;

        if (correct >= questionsList.length * (80 / 100)) {
          print(res.toString());
          getCompetionPrize(res);

        } else {
          getCompetitionPoints(res);
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





  /////Get My Prizes
List<PrizeModel> myPrizes=[];
  Future<List<PrizeModel>> getMyPrizes() async {
    emit(GetMyPrizesLoadingState());
    var myUrl =
    Uri.parse("https://karam-app.com/celo/queencare/public/api/my_prize");

    final response = await http.post(myUrl,
    body: {
      'token': CacheHelper.getData(key: 'api_token'),
    });
    debugPrint(response.statusCode.toString());

    if (response.statusCode == 200) {

      myPrizes = prizeModelListFromJson(response.body);
      debugPrint(myPrizes.toString());
      debugPrint(myPrizes.length.toString());

      emit(GetMyPrizesSuccessState(
        myPrizes: myPrizes,
      ));
    } else if (response.statusCode == 404) {
      emit(GetResultErrorState(error: 'error'));
    }
    return myPrizes;
  }
}
