part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}
class GetAllProductsLoadingState extends CartState {}
class GetAllProductsSuccessState extends CartState {
  final List<CartModel> allProductsList;

  GetAllProductsSuccessState({required this.allProductsList});
}
class GetAllProductsErrorState extends CartState {
  final String error;
  GetAllProductsErrorState({required this.error});

}
class IncreaseProductNumberState extends CartState {
  final int allMoney;

  IncreaseProductNumberState({required this.allMoney});
}
class DecreaseProductNumberState extends CartState {
 final int allMoney;

  DecreaseProductNumberState({required this.allMoney});
}
class CalculateNumberState extends CartState {}
class DeleteFromCartSuccessState extends CartState {}
class DeleteFromCartErrorsState extends CartState {}
class AddOrderLoadingState extends CartState{}
class AddOrderSuccessState extends CartState{}
class AddOrderErrorState extends CartState{}