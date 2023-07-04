part of 'product_cubit.dart';

abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  List<Object> get props => [];
}

class GetAllProductByTypeLoading extends ProductState {}

class GetAllProductByTypeSuccess extends ProductState {
  final List<ProductModel> productsList;

  GetAllProductByTypeSuccess({required this.productsList});
}

class GetAllProductByTypeError extends ProductState {
  final String error;

  GetAllProductByTypeError(this.error);
}

class GetAllProductLoading extends ProductState {}

class GetAllProductSuccess extends ProductState {
  final List<ProductModel> allProductsList;

  GetAllProductSuccess({required this.allProductsList});
}

class GetAllProductError extends ProductState {
  final String error;

  GetAllProductError(this.error);
}

class IncreaseProductNumberState extends ProductState {}

class DecreaseProductNumberState extends ProductState {}

class AddToFavoriteLoadingState extends ProductState {}

class AddToFavoriteSuccessState extends ProductState {
  final String message;
  AddToFavoriteSuccessState({required this.message});
}

class AddToFavoriteErrorState extends ProductState {
  final String error;
  AddToFavoriteErrorState({required this.error});
}

class DeleteFromFavoriteSuccessState extends ProductState {}

class DeleteFromFavoriteErrorsState extends ProductState {}

class DeviceNotConnectedState extends ProductState {}

class AddToCartLoadingState extends ProductState {}

class Empty extends ProductState {}

class AddToCartSuccessState extends ProductState {
  final String message;
  AddToCartSuccessState({required this.message});
}

class AddToCartErrorState extends ProductState {
  final String error;
  AddToCartErrorState({required this.error});
}

class Update extends ProductState {}
