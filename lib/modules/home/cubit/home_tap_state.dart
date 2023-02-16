part of 'home_tap_cubit.dart';

abstract class HomeTapState {}

class HomeInitial extends HomeTapState {}

class NewsBottomNavState extends HomeTapState {}

class GetCategoriesLoading extends HomeTapState {}

class GoToQuestionTap extends HomeTapState {}

class DeviceNotConnectedState extends HomeTapState {}

class GetCategoriesSuccess extends HomeTapState {
  final List<CategoryModel> categoriesList;

  GetCategoriesSuccess({required this.categoriesList});
}

class GetCategoriesError extends HomeTapState {
  final String error;

  GetCategoriesError(this.error);
}
