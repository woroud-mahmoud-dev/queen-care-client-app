import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:http/http.dart' as http;
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/network/local/cache_helper.dart';

part 'consultation_state.dart';

class ConsultationCubit extends Cubit<ConsultationState> {
  ConsultationCubit() : super(ConsultationInitial());
  static ConsultationCubit get(context) => BlocProvider.of(context);
  List<Consultation> myConsultationList = [];
  List<Consultation> allConsultationList = [];
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  ////// المستخدم بيىرل استفسار وبيشوف أسئلتو والدكتور نفس الزبون لكن نوع طبيب فيه يشوف أسئلة كل المستخدمين ويجاوب
  sendQuestion({required String question}) async {
    emit(AddQuestionLoading());
    if (await connectionChecker.hasConnection) {
      try {
        debugPrint(question.toString());
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/add_question");
        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'question': question,
        });

        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          emit(AddQuestionSuccess());
        } else if (response.statusCode == 400||response.statusCode == 404) {
          emit(AddQuestionError());
        }
      } catch (e) {
        emit(AddQuestionError());
      }
    } else {
      emit(DeviceNotConnectedToSendState());
    }
  }

  getMyQuestions() async {
    emit(GetMyQuestionsLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/my_consultation");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
        });

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          myConsultationList = consultationFromJson(response.body);

          if (myConsultationList.isEmpty) {
            emit(MyQuestionsListEmpty());
          } else {
            emit(GetMyQuestionsSuccess());
          }
        } else if (response.statusCode == 404) {
          emit(GetMyQuestionsError());
        }
      } catch (e) {
        emit(GetMyQuestionsError());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
  }

  /////////Doctor
  sendAnswer({required String answer, required int questionId}) async {
    emit(AddAnswerLoading());
    if (await connectionChecker.hasConnection) {
      try {
        debugPrint(answer.toString());
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/add_answer");
        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'), //doctor
          'id': questionId.toString(),
          'answer': answer,
        });

        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          emit(AddAnswerSuccess());
        } else if (response.statusCode == 404) {
          emit(AddAnswerError());
        }
      } catch (e) {
        emit(AddAnswerError());
      }
    } else {
      emit(DeviceNotConnectedToSendState());
    }
  }

  getAllQuestions() async {
    emit(GetAllQuestionsLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/consultation");

        final response = await http.get(myUrl);

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());

          debugPrint(response.statusCode.toString());
          debugPrint(response.body.toString());

          allConsultationList = consultationFromJson(response.body);
          debugPrint(allConsultationList.toString());
          debugPrint(allConsultationList.length.toString());
          if (allConsultationList.isEmpty) {
            emit(AllQuestionsListEmpty());
          } else {
            emit(GetAllQuestionsSuccess());
          }
        } else if (response.statusCode == 404) {
          emit(GetAllQuestionsError());
        }
      } catch (e) {
        emit(GetAllQuestionsError());
      }
    } else {
      emit(DeviceNotConnectedState());
    }
  }

}
