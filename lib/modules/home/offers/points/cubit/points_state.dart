part of 'points_cubit.dart';

@immutable
abstract class PointsState {}

class PointsInitial extends PointsState {}

class GetMyPointsLoading extends PointsState {}

class GetMyPointsLoaded extends PointsState {
var myPoints;

  GetMyPointsLoaded(this.myPoints);
}

class GetMyPointsError extends PointsState {
  final String error;

  GetMyPointsError({required this.error});
}