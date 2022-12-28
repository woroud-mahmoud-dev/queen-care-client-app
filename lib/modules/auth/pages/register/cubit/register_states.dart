
import 'package:queen_care/models/user.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadinglState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  late final UserModel user;
  RegisterSuccessState({required this.user});


}


class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState({required this.error});
}

class SelectGenderState extends RegisterStates {}
class SelectBirthDayState extends RegisterStates {}

class Cheeked extends RegisterStates {}