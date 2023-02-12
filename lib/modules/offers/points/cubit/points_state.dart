part of 'points_cubit.dart';

@immutable
abstract class PointsState {}

class PointsInitial extends PointsState {}

class GetMyPointsLoading extends PointsState {}
class DeviceNotConnectedState extends PointsState {}
class NotInternetToReplaceState extends PointsState {}

class GetMyPointsLoaded extends PointsState {
var myPoints;

  GetMyPointsLoaded(this.myPoints);
}

class GetMyPointsError extends PointsState {
  final String error;

  GetMyPointsError({required this.error});
}
class GetMyPointsPrizeLoadingState extends PointsState {}
class GetMyPointsPrizeSuccessState extends PointsState {}
class GetMyPointsPrizeErrorState extends PointsState {}
class ReplacePointLoadingState extends PointsState {}
class ReplacePointSuccessState extends PointsState {}
class ReplacePointErrorState extends PointsState {}
