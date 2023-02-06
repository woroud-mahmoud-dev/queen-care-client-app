part of 'consultation_cubit.dart';

@immutable
abstract class ConsultationState {}

class ConsultationInitial extends ConsultationState {}
class AddQuestionLoading extends ConsultationState {}
class AddQuestionSuccess extends ConsultationState {}
class AddQuestionError extends ConsultationState {}
/////////////
class AddAnswerLoading extends ConsultationState {}
class AddAnswerSuccess extends ConsultationState {}
class AddAnswerError extends ConsultationState {}
///////////
class GetMyQuestionsLoading extends ConsultationState {}
class GetMyQuestionsSuccess extends ConsultationState {}
class GetMyQuestionsError extends ConsultationState {}
class MyQuestionsListEmpty extends ConsultationState {}
////
class GetAllQuestionsLoading extends ConsultationState {}
class GetAllQuestionsSuccess extends ConsultationState {}
class GetAllQuestionsError extends ConsultationState {}
class AllQuestionsListEmpty extends ConsultationState {}
