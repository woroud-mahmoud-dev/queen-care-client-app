part of 'awards_cubit.dart';

@immutable
abstract class AwardsState {}

class AwardsInitial extends AwardsState {}

class GetMyPrizesLoadingState extends AwardsState {}

class GetMyPrizesSuccessState extends AwardsState {
  final List<CompetitionPrize> myPrizes;
  GetMyPrizesSuccessState({required this.myPrizes});
}

class GetMyPrizesErrorState extends AwardsState {
  final String error;

  GetMyPrizesErrorState({required this.error});
}

class DeviceNotConnectedState extends AwardsState {}
