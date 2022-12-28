import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/competion.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/models/question.dart';

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
      print(response.statusCode);
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

  int currentStep = 1;
  int correct = 0;
  // int stepLength = questionsList.length;
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

  List toggleButtons = List.generate(3, (index) => false);

  bool isStarted = false;
  bool isReady = false;

  int indexQ = 0;

  void onPressedToggleButton(int index) {
    for (int i = 0; i < 3; i++) {
      if (i == index) {
        toggleButtons[i] = true;
      } else {
        toggleButtons[i] = false;
      }
    }

    emit(GoNextStep());
  }

  void onPressedContinueButton() {
    bool isSelected = false;

    for (int i = 0; i < 3; i++) {
      if (toggleButtons[i]) {
        isSelected = true;
      }
    }

    if (!isSelected) {
      showToast(text: ' الرجاء اختيار إجابة اولا', color: Colors.green);
      return;
    }

    if (indexQ == 9) {
      return;
    }

    if (isStarted == false) {
      isStarted = true;
      emit(GoNextStep());

      return;
    }

    if (isReady == false) {
      isReady = true;
      toggleButtons = List.generate(3, (index) => false);
      emit(GoNextStep());
      return;
    }

    if (isReady) {
      indexQ++;
      toggleButtons = List.generate(3, (index) => false);

      emit(GoNextStep());

      return;
    }
  }

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
        if (correct >= questionsList.length * (80 / 100)) {
          emit(FinishStateWithWin());
        } else {
         emit( FinishStateWithLoss());
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
}
