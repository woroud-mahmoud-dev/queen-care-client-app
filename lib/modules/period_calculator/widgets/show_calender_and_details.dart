import 'package:flutter/material.dart';

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
          const PeriodItem(
            color: Color(0xff852727),
            name: 'فترة الدورة',
          ),
          const PeriodItem(
            color: Colors.deepOrange,
            name: 'الدورة التالية',
          ),
          const PeriodItem(
            color: Colors.black,
            name: 'يوم الامان',
          ),
          const PeriodItem(
            color: Colors.pinkAccent,
            name: 'يوم الامان',
          ),
          const PeriodItem(
            color: Colors.white,
            name: 'فترة الخصوبة',
          ),
          const PeriodItem(
            color: Colors.yellow,
            name: 'يوم التبويض',
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:       CustomButton(
              title: 'طباعة التقويم الخاص بي',
              onTap: () {

              },
              color: kPrimaryColor,
              width: w * 0.55,
              height: h * 0.065,
            ),
          ),

          const Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: darkGrey2,
          ),
          Row(
            children:const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "أعراضك",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Spacer(),

            ],
          ),
          Row(
            children:const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "تدفق الحيض",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Spacer(),

            ],
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidgetWithIcon(
                name: 'ضعيف',
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
                name: 'متوسط',
                widget2: Row(
                  children: const [
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
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
                name: 'غزير',
                widget2: Row(
                  children: const [
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
                    ),
                    Icon(
                      Icons.water_drop_rounded,
                      color: Color(0xff852727),
                      size: 12,
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
            children:const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "الأعراض",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Spacer(),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidget(
                name: 'صداع',
                value: 1,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectTow(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueTow,
              ),
              ItemWidget(
                name: 'تشنجات',
                value: 2,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectTow(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueTow,
              ),
              ItemWidget(
                name: 'كل شيء على ما يرام',
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
            children:const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "المزاج",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Spacer(),

            ],
          ), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ItemWidget(
                name: 'توتر',
                value: 1,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'تعب واكتآب',
                value: 2,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'جيد',
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
                name: 'حساسية مفرطة',
                value: 4,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'تقلب المزاج',
                value: 5,
                onChanged: (value) {
                  CalculatorCubit.get(context).selectThree(value);
                },
                groupValue: CalculatorCubit.get(context).groupValueThree,
              ),
              ItemWidget(
                name: 'غضب وانفعال',
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
