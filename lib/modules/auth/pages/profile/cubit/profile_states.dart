

import 'package:queen_care/models/user.dart';

abstract class ProfileCubitState {}

class ProfileCubitInitial extends ProfileCubitState {}

class GetProfileLoading extends ProfileCubitState {}

class GetProfileLoaded extends ProfileCubitState {
  final UserModel user;

  GetProfileLoaded(this.user);
}

class GetProfileError extends ProfileCubitState {
  final String error;

  GetProfileError({required this.error});
}


class EditeProfileLoading extends ProfileCubitState {}
class SelectGenderState extends ProfileCubitState {}

class  EditeProfileSuccess extends ProfileCubitState {
  final UserModel user;

  EditeProfileSuccess(this.user);
}

class  EditeProfileError extends ProfileCubitState {
  final String error;

  EditeProfileError({required this.error});
}
class SelectBirthDayState extends ProfileCubitState {}
class ConvertToCompanyState extends ProfileCubitState{}
class ConvertToCompanySuccessState extends ProfileCubitState{}
class ConvertToCompanyErrorState extends ProfileCubitState{}