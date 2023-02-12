part of 'advice_cubit.dart';

@immutable
abstract class AdviceState {}

class AdviceInitial extends AdviceState {}
class GetCategoriesLoading extends AdviceState{}
class DeviceNotConnectedState extends AdviceState{}
class GetCategoriesSuccess extends AdviceState{
  final List<CategoryBlogModel> categoriesList;

  GetCategoriesSuccess({required this.categoriesList});

}
class GetCategoriesError extends AdviceState{
  final String error;

  GetCategoriesError(this.error);
}
class GetBlogsLoading extends AdviceState{}
class GetBlogsSuccess extends AdviceState{
  final List<BlogModel> blogsList;

  GetBlogsSuccess({required this.blogsList});

}
class GetAllBlogsSuccess extends AdviceState{
  final List<BlogModel> blogsList;

  GetAllBlogsSuccess({required this.blogsList});

}
class GetBlogsError extends AdviceState{
  final String error;

  GetBlogsError(this.error);
}