import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit()..calculator(),
      child: BlocConsumer<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          EventList<Event> markedDateMap = EventList<Event>(
            events: {},
          );

          DateTime currentDate = DateTime.now();


          Widget periodIcon(String day) => Container(
                color: kPrimaryColor2,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                        color: Color(0xff852727), fontWeight: FontWeight.bold),
                  ),
                ),
              );
          Widget nextPeriodIcon(String day) => Container(
                color: kPrimaryColor2,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                ),
              );
          Widget ovulationDayIcon(String day) => Container(
                color: kPrimaryColor2,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                        color: Color(0xffE6FF06),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              );
          Widget firstRangeDayIcon(String day) => Container(
                color: kPrimaryColor2,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      color:  Color(0xff0312E5),
                    ),
                  ),
                ),
              );
          Widget safeRangeDayIcon(String day) => Container(
            color: kPrimaryColor2,
                child: Center(
                  child: Text(
                    day,
                    style: const TextStyle(
                      color: darkGrey2,fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              );
          List<DateTime> periodDates = CalculatorCubit.get(context).periodDates;

          List<DateTime> firstSafeRangDates =     CalculatorCubit.get(context).firstSafeRangDates;
          List<DateTime> secondSafeRangDates =     CalculatorCubit.get(context).secondSafeRangDates;
          List<DateTime> firstRangDates =
              CalculatorCubit.get(context).firstRangDates;
          List<DateTime> secondRangDates =
              CalculatorCubit.get(context).secondRangDates;
          List<DateTime> ovulationRangDates =
              CalculatorCubit.get(context).ovulationDayList;
          List<DateTime> nextPeriodDates =
              CalculatorCubit.get(context).nextPeriodDates;
          for (int i = 0; i < nextPeriodDates.length; i++) {
            markedDateMap.add(
              nextPeriodDates[i],
              Event(
                date: DateTime.parse(nextPeriodDates[i].toString()),
                title: 'nextPeriodDates',
                icon: nextPeriodIcon(
                  nextPeriodDates[i].day.toString(),
                ),
              ),
            );
          }
          for (int i = 0; i < ovulationRangDates.length; i++) {
            markedDateMap.add(
              ovulationRangDates[i],
              Event(
                date: DateTime.parse(ovulationRangDates[i].toString()),
                title: 'ovulationRangDates',
                icon: ovulationDayIcon(
                  ovulationRangDates[i].day.toString(),
                ),
              ),
            );
          }
          for (int i = 0; i < firstSafeRangDates.length; i++) {
            markedDateMap.add(
              firstSafeRangDates[i],
              Event(
                date: DateTime.parse(firstSafeRangDates[i].toString()),
                title: 'firstSafeRangDates',
                icon: safeRangeDayIcon(
                  firstSafeRangDates[i].day.toString(),
                ),
              ),
            );
          }
          for (int i = 0; i < secondSafeRangDates.length; i++) {
            markedDateMap.add(
              secondSafeRangDates[i],
              Event(
                date: DateTime.parse(secondSafeRangDates[i].toString()),
                title: 'secondSafeRangDates',
                icon: safeRangeDayIcon(
                  secondSafeRangDates[i].day.toString(),
                ),
              ),
            );
          }
          for (int i = 0; i < periodDates.length; i++) {
            markedDateMap.add(
              periodDates[i],
              Event(
                date: DateTime.parse(periodDates[i].toString()),
                title: 'Event1',
                icon: periodIcon(
                  periodDates[i].day.toString(),
                ),
              ),
            );
          }

          for (int i = 0; i < firstRangDates.length; i++) {
            markedDateMap.add(
              firstRangDates[i],
              Event(
                date: firstRangDates[i],
                title: 'Event 5',
                icon: firstRangeDayIcon(
                  firstRangDates[i].day.toString(),
                ),
              ),
            );
          }

          for (int i = 0; i < secondRangDates.length; i++) {
            markedDateMap.add(
              secondRangDates[i],
              Event(
                date: secondRangDates[i],
                title: '',
                icon: firstRangeDayIcon(
                  secondRangDates[i].day.toString(),
                ),
              ),
            );
          }
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5)
                ,
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.09,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          CalculatorCubit.get(context).getPrevtMonth();
                        },
                        child: SvgPicture.asset('assets/icons/prev.svg',
                          width: 35,
                          height: 35,)),
                    InkWell(
                        onTap: () {
                          CalculatorCubit.get(context).getNextMonth();
                        },
                        child: SvgPicture.asset('assets/icons/next.svg',
                        width: 35,
                          height: 35,
                        )),


          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width*0.25,
            decoration: BoxDecoration(
              color: darkGrey2,
borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
            CalculatorCubit.get(context). selectedMonth,
            style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            ),),
          ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.3,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: kPrimaryColor2,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CalendarCarousel<Event>(
                  isScrollable: false,
                  height: MediaQuery.of(context).size.height * 0.45,
                  targetDateTime: CalculatorCubit.get(context).targetDateTime,
                  todayButtonColor: Colors.transparent,
                  todayTextStyle: const TextStyle(color: Colors.black),

                  todayBorderColor: Colors.transparent,

                  showHeader: false,

                  weekFormat: false,

                  markedDatesMap: markedDateMap,
                  markedDateShowIcon: true,
                  markedDateIconMaxShown: 1,
                  markedDateMoreShowTotal: null,

                  prevDaysTextStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  headerTitleTouchable: false,

                  headerTextStyle: const TextStyle(color: darkGrey2),
          weekdayTextStyle :const TextStyle(color: Colors.black),
                  thisMonthDayBorderColor: Colors.black,

                  minSelectedDate: currentDate.subtract(const Duration(days: 360)),
                  maxSelectedDate: currentDate.add(const Duration(days: 360)),
                  // null for not showing hidden events indicator
                  markedDateIconBuilder: (event) {
                    return event.icon;
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
