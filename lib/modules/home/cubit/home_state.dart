part of 'home_cubit.dart';

abstract class HomeState  {

}

class HomeInitial extends HomeState {

}
class NewsBottomNavState extends HomeState{}
class GetCategoriesLoading extends HomeState{}
class GoToQuestionTap extends HomeState{}
class GetCategoriesSuccess extends HomeState{
  final List<CategoryModel> categoriesList;

  GetCategoriesSuccess({required this.categoriesList});

}
class GetCategoriesError extends HomeState{
  final String error;

  GetCategoriesError(this.error);
}