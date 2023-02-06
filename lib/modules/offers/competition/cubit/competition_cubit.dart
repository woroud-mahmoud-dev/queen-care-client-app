import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/competition.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/models/profile.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/network/local/cache_helper.dart';

part 'competition_state.dart';

class CompetitionCubit extends Cubit<CompetitionState> {
  CompetitionCubit() : super(OffersInitial());
  static CompetitionCubit get(context) => BlocProvider.of(context);
  MyService myService = MyService();
  PrizeModel? prizeModel;
  ProfileModel? profileModel;
  int currentStep = 1;
  int correct = 0;
  bool? complete;
  int indexQ = 0;
  String? answerGroupValue;
  List<Competition> allCompetitionsList = [];
  List<Question> questionsList = [];
  Future<List<Competition>> getAllCompetitions() async {
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

  Future<List<Question>> getQuestions() async {
    emit(GetAllQuestionsLoadingState());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/Question");

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
    return questionsList;
  }

  Future<PrizeModel?> getCompetitionPrize(var result) async {
    emit(SendResultStateLoading());
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
    return prizeModel;
  }

  Future<ProfileModel?> getCompetitionPoints(var result) async {
    print(result);
    emit(SendResultStateLoading());
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
      profileModel = profileFromJson(response.body);
      debugPrint('the points has :${profileModel!.point}');

      emit(FinishStateWithLoss(profileModel!.point));
    } else if (response.statusCode == 404) {
      emit(GetResultErrorState(error: 'error'));
    }
    return profileModel;
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

  void onPressNext() {
    if (answerGroupValue != null) {
      if (indexQ + 1 == questionsList.length) {
        debugPrint('correct is $correct');
        debugPrint('correct is $correct');
        debugPrint('questionsList 80% is ${questionsList.length * (80 / 100)}');
        debugPrint('IS winner ${correct >= questionsList.length * (80 / 100)}');
        var res = (correct / questionsList.length) * 100;

        if (correct >= questionsList.length * (80 / 100)) {
          debugPrint(res.toString());
          getCompetitionPrize(res);
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
