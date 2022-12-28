part of 'offers_cubit.dart';

@immutable
abstract class OffersState {}

class OffersInitial extends OffersState {}
class GoNextStep extends OffersState {}
class CompleteState extends OffersState {}
class SelectWrongAnswerState extends OffersState {}
class SelectCorrectAnswerState extends OffersState {}
class FinishStateWithWin extends OffersState {}
class FinishStateWithLoss extends OffersState {}
class GetAllCompetitionsLoadingState extends OffersState {}
class GetAllCompetitionsSuccessState extends OffersState {
  final List<Comptition> allCompetitionsLis;
  GetAllCompetitionsSuccessState({required this.allCompetitionsLis});
}
class GetAllCompetitionsErrorState extends OffersState {
  final String error;

  GetAllCompetitionsErrorState({required this.error});
}
class GetAllQuestionsLoadingState extends OffersState {}
class GetAllQuestionsSuccessState extends OffersState {
  final List<Question> questionsList;
  GetAllQuestionsSuccessState({required this.questionsList});
}
class GetAllQuestionsErrorState extends OffersState {
  final String error;

  GetAllQuestionsErrorState({required this.error});
}