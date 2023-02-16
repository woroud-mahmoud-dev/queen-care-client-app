import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';
import 'package:queen_care/modules/period_calculator/widgets/how_long_question.dart';
import 'package:queen_care/modules/period_calculator/widgets/how_many_days_question_widget.dart';
import 'package:queen_care/modules/period_calculator/widgets/question_text.dart';
import 'package:queen_care/modules/period_calculator/widgets/show_data_picker.dart';

class PeriodQuestions extends StatelessWidget {
  PeriodQuestions({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  final dateTime = DateTime.now();

  final myService = MyService();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          if (state is CalculateDatesSuccess) {
            tabController.animateTo(8);
          }
          if (state is CalculateDatesError) {
            showToast(text: 'sure'.tr(context), color: kPrimaryColor);
          }
        },
        builder: (context, state) {
          String? formattedDate;
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: customBoxDecoration,
            child: Column(
              children: [
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
                            size: 13,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'period_calculator'.tr(context),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    LogoImage(
                      w: w * 0.22,
                      h: h * 0.11,
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 10),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QuestionText(text: 'answer_questions'.tr(context)),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        QuestionText(
                          text: 'last_period_start'.tr(context),
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
                                      ? 'select'.tr(context)
                                      : CalculatorCubit.get(context)
                                          .selectLastDateIs
                                          .toString(),
                                  style: const TextStyle(
                                      color: kPrimaryColor, fontSize: 14),
                                ),
                                onTap: () async {
                                  DateTime? newDate = await buildShowDatePicker(
                                      context, dateTime);
                                  myService.setLastDate = newDate!;

                                  // ignore: use_build_context_synchronously
                                  CalculatorCubit.get(context)
                                      .selectLastDate(newDate);
                                  // ignore: unnecessary_null_comparison
                                  if (newDate != null) {
                                    myService.setLastDate = newDate;
                                    debugPrint(
                                        myService.getLastDate.toString());
                                    formattedDate =
                                        intl.DateFormat('yyyy-MM-dd')
                                            .format(newDate);
                                    debugPrint(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16

                                  } else {}
                                },
                              ),
                            ),
                            const Divider(
                              thickness: 0.8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        QuestionText(
                          text: 'duration_of_menstruation'.tr(context),
                        ),
                        HowLongQuestion(myService: myService),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        QuestionText(
                          text: 'how_many_days'.tr(context),
                        ),
                        HowManyDaysQuestion(myService: myService),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Center(
                          child: CustomButton(
                            title: 'track'.tr(context),
                            onTap: () {
                              CalculatorCubit.get(context).calculator();
                            },
                            color: kPrimaryColor,
                            width: w * 0.72,
                            height: h * 0.07,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
