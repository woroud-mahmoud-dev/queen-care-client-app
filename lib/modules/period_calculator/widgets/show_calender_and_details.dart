import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';
import 'package:queen_care/modules/period_calculator/widgets/calendar_widget.dart';
import 'package:queen_care/modules/period_calculator/widgets/period_item.dart';
import 'package:queen_care/modules/period_calculator/widgets/select_item.dart';

class ShowCalenderAndDetails extends StatelessWidget {
  const ShowCalenderAndDetails({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.vertical(
          top: Radius.elliptical(50, 30),
        ),
      ),
      child: Column(
        children: [
          const CalendarWidget(),
          SizedBox(
            height: h * 0.03,
          ),
          PeriodItem(
            color: const Color(0xff852727),
            name: 'cycle_period'.tr(context),
          ),
          PeriodItem(
            color: Colors.deepOrange,
            name: 'next_period'.tr(context),
          ),
          PeriodItem(
            color: Colors.black,
            name: 'Safety_day'.tr(context),
          ),
          PeriodItem(
            color: Colors.pinkAccent,
            name: 'Safety_day'.tr(context),
          ),
          PeriodItem(
            color: Colors.white,
            name: 'fertile_period'.tr(context),
          ),
          PeriodItem(
            color: Colors.yellow,
            name: 'ovulation_day'.tr(context),
          ),
          Row(
            children: [
              const Spacer(),
              CustomButton(
                title: 'print'.tr(context),
                onTap: () {},
                color: kPrimaryColor,
                width: w * 0.65,
                height: h * 0.065,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: darkGrey2,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "your_symptoms".tr(context),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Menstrual_flow".tr(context),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              const Spacer(),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidgetWithIcon(
                name: 'scarce'.tr(context),
                widget2: Row(
                  children: const [
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                  ],
                ),
                value: 3,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectOne(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueOne,
              ),
              ItemWidgetWithIcon(
                name: 'middle'.tr(context),
                widget2: Row(
                  children: [
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                  ],
                ),
                value: 2,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectOne(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueOne,
              ),
              ItemWidgetWithIcon(
                name: 'superabundant'.tr(context),
                widget2: Row(
                  children: [
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: const Color(0xff852727),
                      size: 11.sp,
                    ),
                  ],
                ),
                value: 1,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectOne(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueOne,
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "symptoms".tr(context),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidget(
                name: 'headache'.tr(context),
                value: 1,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectTow(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueTow,
              ),
              ItemWidget(
                name: 'cramps'.tr(context),
                value: 2,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectTow(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueTow,
              ),
              ItemWidget(
                name: 'All_is_well'.tr(context),
                value: 3,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectTow(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueTow,
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          const Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: darkGrey2,
          ),
          SizedBox(
            height: h * 0.02,
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "the_mood".tr(context),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              const Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidget(
                name: 'Nervous'.tr(context),
                value: 1,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'depressed'.tr(context),
                value: 2,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'good'.tr(context),
                value: 3,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidget(
                name: 'sensitivity'.tr(context),
                value: 4,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'Swings'.tr(context),
                value: 5,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'Anger_and_Agitation'.tr(context),
                value: 6,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
          // const Divider(
          //   thickness: 1,
          //   endIndent: 15,
          //   indent: 15,
          //   color: darkGrey2,
          // ),
          // SizedBox(
          //   height: h * 0.02,
          // ),
          // const Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Text(
          //       "تتبع الإباضة",
          //       style: TextStyle(fontSize: 12),
          //     ),
          //   ),
          // ),
          // const Align(
          //   alignment: Alignment.topRight,
          //   child: Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Text(
          //       "فرصة حدوث حمل مرتفع هو يوم:17",
          //       style: TextStyle(fontSize: 12, color: darkGrey2),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: h * 0.05,
          // ),
        ],
      ),
    );
  }
}
