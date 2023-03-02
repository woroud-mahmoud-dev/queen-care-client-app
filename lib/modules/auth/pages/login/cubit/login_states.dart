import 'package:queen_care/models/user.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  late final UserModel user;
  LoginSuccessState({required this.user});
}

class LoginNSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState({required this.error});
}

class ChangeRememberMeState extends LoginStates {}

class DeviceNotConnectedState extends LoginStates {}
class UserDataInvalid extends LoginStates {}
