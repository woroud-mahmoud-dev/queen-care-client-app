// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';

class PeriodQuestions extends StatelessWidget {
  PeriodQuestions({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
MyService myService =MyService();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          if(state is CalculateDatesSuccess){
            tabController.animateTo(8);
          }
          if(state is CalculateDatesError){
            showToast(text: 'تأكدي من إدخال جميع\n المعلومات وبشكل صحيح', color: Colors.red);
          }
        },
        builder: (context, state) {

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor2,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              tabController.animateTo(3);

                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: black,
                            )),
                        const Spacer(),
                        const GoCart(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/icons/list.svg',
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'حاسبة الدورة الشهرية',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: h * 0.75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(50, 30),
                      ),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'أجيبي عن الأسئلة التالية :',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          const Text(
                            '1  متى بدأ آخر حيض عدك؟',
                            style: TextStyle(fontSize: 16),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  child: Text(
                                    CalculatorCubit.get(context)
                                                .selectLastDateIs ==
                                            null
                                        ? 'select'
                                        : CalculatorCubit.get(context)
                                            .selectLastDateIs
                                            .toString(),
                                    style: const TextStyle(
                                        color: kPrimaryColor, fontSize: 16),
                                  ),
                                  onTap: () {
                                    DatePicker.showDatePicker(context,
                                        theme: const DatePickerTheme(
                                          containerHeight: 210.0,
                                        ),
                                        maxTime: DateTime.now(),
                                        showTitleActions: true,
                                        onChanged: (time) {
                                          myService.setLastDate =time;
                                      CalculatorCubit.get(context)
                                          .selectLastDate(time);

                                    }, onConfirm: (time) {
                                      CalculatorCubit.get(context)
                                          .selectLastDate(time);
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.en);
                                  },
                                ),
                              ),
                              const Divider(
                                thickness: 0.8,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          const Text(
                            '2 ما مد الحيض لديك؟',
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton

                            (
                            icon: const SizedBox(),
                            isExpanded: true,
                            elevation: 20,
                            alignment: Alignment.topCenter,

                            menuMaxHeight: 200,


                            items: [
                            2,3,4,5,6,7,

                          // ignore: sort_child_properties_last
                          ].map((e) => DropdownMenuItem(child: Text('$eيوم',style:  const TextStyle(color: kPrimaryColor),),
                          value: e,)).toList(), onChanged: (value){
                            debugPrint('onChange $value');
                            myService.setDaysNumber=value as int;
                            CalculatorCubit.get(context).selectDurationOfTheMenstrualCycl(value  );

                          },value: CalculatorCubit.get(context).selectedIndexOfDays,),   SizedBox(
                            height: h * 0.05,
                          ),
                          const Text(
                            '3 كم يوم تدوم دورتك الشهرية؟',
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton

                            (
                            icon: const SizedBox(),
                            isExpanded: true,
                            elevation: 20,
                            alignment: Alignment.topCenter,

                            menuMaxHeight: 200,


                            items: [
                            21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,

                            ].map((e) => DropdownMenuItem(value: e,child: Text('$eيوم  ',style:const TextStyle(color: kPrimaryColor),),)).toList(), onChanged: (value){
                            myService.setHowLongPeriod=value as int;

                            debugPrint('onChange $value');
                            CalculatorCubit.get(context).selectDurationBetweenOfTowMenstrualCycle(value);

                          },value: CalculatorCubit.get(context).howLongPeriod,),

                          SizedBox(
                            height: h * 0.05,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                CalculatorCubit.get(context).calculator();


                              },
                              child: SizedBox(
                                width: w * 0.72,
                                height: h * 0.1,
                                child: Card(
                                  color: kPrimaryColor2,
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Text(
                                            'تتبع الدورة الشهرية',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

