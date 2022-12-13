part of 'product_cubit.dart';

abstract class ProductState  {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];

}
class GetAllProductByTypeLoading extends ProductState{}
class GetAllProductByTypeSuccess extends ProductState{
  final List<ProductModel> productsList;

  GetAllProductByTypeSuccess({required this.productsList});

}
class GetAllProductByTypeError extends ProductState{
  final String error;

  GetAllProductByTypeError(this.error);
}
class GetAllProductLoading extends ProductState{}
class GetAllProductSuccess extends ProductState{
  final List<ProductModel> allProductsList;

  GetAllProductSuccess({required this.allProductsList});

}
class GetAllProductError extends ProductState{
  final String error;

  GetAllProductError(this.error);
}
class IncreaseProductNumberState extends ProductState{

}
class DecreaseProductNumberState extends ProductState{

}
