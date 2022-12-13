part of 'calculator_cubit.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}
class SelectLastDate extends CalculatorState{
  final DateTime dateTime;

  SelectLastDate({required this.dateTime});

}
class SelectHowLongPeriod extends CalculatorState{}
class SelectDayNumber extends CalculatorState{}
class CalculateDatesSuccess extends CalculatorState{}
class CalculateDatesError extends CalculatorState{}
class Calculate1 extends CalculatorState{}
class Calculate2 extends CalculatorState{}
class Calculate3 extends CalculatorState{}
class Calculate4 extends CalculatorState{}
class Calculate5 extends CalculatorState{}
class GetNextMonthState extends CalculatorState{}
class GetPrevMonthState extends CalculatorState{}
class SelectOneState extends CalculatorState{

}
class SelectTowState extends CalculatorState{

}
class SelectThreeState extends CalculatorState{

}
