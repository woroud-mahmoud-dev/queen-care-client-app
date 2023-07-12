part of 'my_order_cubit.dart';

@immutable
abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}

class MyOrdersEmpty extends MyOrderState {}

class DeviceNotConnectedState extends MyOrderState {}

class MyOrderSuccess extends MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderError extends MyOrderState {
  final String error;

  MyOrderError(this.error);
}
