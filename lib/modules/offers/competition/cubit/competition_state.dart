part of 'competition_cubit.dart';

@immutable
abstract class CompetitionState {}

class OffersInitial extends CompetitionState {}

class GoNextStep extends CompetitionState {}

class CompleteState extends CompetitionState {}

class SelectWrongAnswerState extends CompetitionState {}

class SelectCorrectAnswerState extends CompetitionState {}

class FinishStateWithWin extends CompetitionState {
  final PrizeModel prizeModel;

  FinishStateWithWin(this.prizeModel);
}

class FinishStateWithLoss extends CompetitionState {
  final dynamic points;

  FinishStateWithLoss(this.points);
}

class GetAllCompetitionsLoadingState extends CompetitionState {}

class GetAllCompetitionsSuccessState extends CompetitionState {
  final List<Competition> allCompetitionsLis;
  GetAllCompetitionsSuccessState({required this.allCompetitionsLis});
}

class GetAllCompetitionsErrorState extends CompetitionState {
  final String error;

  GetAllCompetitionsErrorState({required this.error});
}

class GetAllQuestionsLoadingState extends CompetitionState {}

class GetAllQuestionsSuccessState extends CompetitionState {
  final List<Question> questionsList;
  GetAllQuestionsSuccessState({required this.questionsList});
}

class GetAllQuestionsErrorState extends CompetitionState {
  final String error;

  GetAllQuestionsErrorState({required this.error});
}

class DeviceNotConnectedState extends CompetitionState {}

class DeviceNotConnectedToSendResultState extends CompetitionState {}

class SendResultStateLoading extends CompetitionState {}

class GetResultErrorState extends CompetitionState {
  final String error;

  GetResultErrorState({required this.error});
}
