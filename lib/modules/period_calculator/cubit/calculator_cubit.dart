import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:queen_care/core/my_service.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());
  static CalculatorCubit get(context) => BlocProvider.of(context);
  DateTime dateTime = DateTime.now();
  String? selectLastDateIs;
  MyService myService = MyService();
  void selectLastDate(DateTime time) {
    dateTime = DateTime.parse(time.toString());
    selectLastDateIs = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    emit(SelectLastDate(dateTime: dateTime));
  }

  DateTime targetDateTime = DateTime.now();
///////////// مدة استمرار الدورة الشهرية ........1=====15 يومSelectDayNumber
  int? selectedIndexOfDays;
  void selectDurationOfTheMenstrualCycle(int index) {
    selectedIndexOfDays = index;
    debugPrint(selectedIndexOfDays.toString());
    emit(SelectDayNumber());
  }
//how long period //27.......المدة بين الدورة والدورة التالية

  int? howLongPeriod;

  void selectDurationBetweenOfTowMenstrualCycle(int index) {
    howLongPeriod = index;
    debugPrint(howLongPeriod.toString());
    emit(SelectHowLongPeriod());
  }

  //>>>يوم الاباضة ..ovulation day
  //last selectLastDateIs - 14 يوم,
  //nextPeriod الدورة التالية
  //فترة الخصوبة الاولى قبل الاباضة  firstRange
  //يوم التبويض - 4
  //فترة الخصوبة التانية بعد الاباضة ,,,,,يوم التبويض +5 secondRange
  //فترة الدورة الشهرية هي تاريخ اخر دورة +عدد ايام الاستمرار
  DateTime? ovulationDay;
  DateTime? nextPeriod;
  DateTimeRange? firstRange;

  void calculator() {
    try {
      if (myService.getLastDate == null ||
          myService.getHowLongPeriod == null ||
          myService.getDaysNumber == null) {
        emit(CalculateDatesError());
      } else {
        debugPrint('dateTime  ${myService.getLastDate}');
        debugPrint('selectedIndexOfDays  ${myService.getDaysNumber}');
        debugPrint('howLongPeriod  ${myService.getHowLongPeriod}');
        nextPeriod = myService.getLastDate!
            .add(Duration(days: myService.getHowLongPeriod!));
        ovulationDay = nextPeriod!.subtract(const Duration(days: 14));

        getPeriodDates();
        getFirstRangDates();
        getSecondRangDates();
        getOvulationDayList();
        getNextPeriodDates();

        emit(CalculateDatesSuccess());
      }
    } catch (e) {
      debugPrint('error is :$e');

      emit(CalculateDatesError());
    }
  }

  List<DateTime> periodDates = [];
  List<DateTime> firstRangDates = [];
  List<DateTime> secondRangDates = [];
  List<DateTime> ovulationDayList = [];
  List<DateTime> nextPeriodDates = [];
  List<DateTime> firstSafeRangDates = [];
  List<DateTime> secondSafeRangDates = [];
  List<DateTime> getPeriodDates() {
    DateTime start = myService.getLastDate!;
    DateTime end =
        myService.getLastDate!.add(Duration(days: myService.getDaysNumber!));
    final periodDatesExtracted = end.difference(start).inDays;
    periodDates = List.generate(periodDatesExtracted,
        (i) => DateTime(start.year, start.month, start.day + (i)));
    emit(Calculate1());
    return periodDates;
  }

  List<DateTime> getNextPeriodDates() {
    DateTime start = nextPeriod!;
    DateTime end = nextPeriod!.add(Duration(days: myService.getDaysNumber!));
    final periodDatesExtracted = end.difference(start).inDays;
    nextPeriodDates = List.generate(periodDatesExtracted,
        (i) => DateTime(start.year, start.month, start.day + (i)));
    emit(Calculate5());
    return nextPeriodDates;
  }

  List<DateTime> getFirstRangDates() {
    DateTime start = ovulationDay!.subtract(const Duration(days: 5));
    DateTime end = ovulationDay!.subtract(const Duration(days: 0));
    final firstRangDatesExtracted = end.difference(start).inDays;
    firstRangDates = List.generate(firstRangDatesExtracted,
        (i) => DateTime(start.year, start.month, start.day + (i)));
    emit(Calculate2());

    return firstRangDates;
  }

  List<DateTime> getSecondRangDates() {
    DateTime start = ovulationDay!.add(const Duration(days: 1));
    DateTime end = ovulationDay!.add(const Duration(days: 5));
    final secondRangDatesExtracted = end.difference(start).inDays;

    secondRangDates = List.generate(
        secondRangDatesExtracted,
        (i) => DateTime.parse(
            DateTime(start.year, start.month, start.day + (i)).toString()));
    emit(Calculate3());

    return secondRangDates;
  }

  List<DateTime> getOvulationDayList() {
    ovulationDayList = [
      DateTime(ovulationDay!.year, ovulationDay!.month, ovulationDay!.day)
    ];
    emit(Calculate4());

    return ovulationDayList;
  }

  List<DateTime> getFirstSafeRangDates() {
    DateTime start =
        myService.getLastDate!.add(Duration(days: myService.getDaysNumber!));
    DateTime end = ovulationDay!.subtract(const Duration(days: 5));
    final firstSafeRangDatesExtracted = end.difference(start).inDays;
    firstSafeRangDates = List.generate(firstSafeRangDatesExtracted,
        (i) => DateTime(start.year, start.month, start.day + (i)));
    // emit(Calculate2());

    return firstSafeRangDates;
  }

  List<DateTime> getSecondSafeRangDates() {
    DateTime start = ovulationDay!.add(const Duration(days: 5));

    DateTime end = nextPeriod!.subtract(const Duration(days: 0));
    final secondSafeRangDatesExtracted = end.difference(start).inDays;
    secondSafeRangDates = List.generate(secondSafeRangDatesExtracted,
        (i) => DateTime(start.year, start.month, start.day + (i)));

    return secondSafeRangDates;
  }

  DateTime selectedDate = DateTime.now();
  String selectedMonth = DateFormat.yM().format(DateTime.now());
  void getNextMonth() {
    targetDateTime = DateTime(targetDateTime.year, targetDateTime.month + 1);
    selectedMonth = DateFormat.yMMM().format(targetDateTime);
    emit(GetNextMonthState());
  }

  void getMonth() {
    targetDateTime = DateTime(targetDateTime.year, targetDateTime.month - 1);
    selectedMonth = DateFormat.yMMM().format(targetDateTime);
    emit(GetPrevMonthState());
  }

  //////////
  //تدفق الحيض
  int? groupValueOne;
  //الاعراض
  int? groupValueTow;
  //المزاج
  int? groupValueThree;
  void selectOne(int index) {
    groupValueOne = index;

    emit((SelectOneState()));
  }

  void selectTow(int index) {
    groupValueTow = index;

    emit((SelectTowState()));
  }

  void selectThree(int index) {
    groupValueThree = index;

    emit((SelectThreeState()));
  }
}
