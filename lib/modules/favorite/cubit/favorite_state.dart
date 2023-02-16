part of 'favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class GetFavoriteProductLoading extends FavoriteState {}

class GetFavoriteProductSuccess extends FavoriteState {
  final List<FavoriteModel> allProductsList;

  GetFavoriteProductSuccess({required this.allProductsList});
}

class GetFavoriteProductError extends FavoriteState {
  final String error;

  GetFavoriteProductError(this.error);
}

class DeleteFromFavoriteSuccessState extends FavoriteState {}

class DeleteFromFavoriteErrorsState extends FavoriteState {}

class DeviceNotConnectedState extends FavoriteState {}
