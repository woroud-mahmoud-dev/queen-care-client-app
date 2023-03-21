import 'package:queen_care/models/country.dart';
import 'package:queen_care/models/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterUserModel user;
  RegisterSuccessState({required this.user});
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState({required this.error});
}

class NumberUsedState extends RegisterStates {
  final String error;

  NumberUsedState({required this.error});
}

class SelectGenderState extends RegisterStates {}

class Cheeked extends RegisterStates {}

class SelectBirthDayState extends RegisterStates {}

class DeviceNotConnectedState extends RegisterStates {}

class ErrorState extends RegisterStates {}

class LoadingState extends RegisterStates {}

class LoadedSuccess extends RegisterStates {}

class LoadingErrorState extends RegisterStates {}
class SelectCountryState extends RegisterStates {
  final Country country;

  SelectCountryState(this.country);
}
class SelectCityState extends RegisterStates {}
class SelectAreaState extends RegisterStates {}
