import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';
import 'package:queen_care/modules/period_calculator/widgets/calendar_widget.dart';
import 'package:queen_care/modules/period_calculator/widgets/setect_item.dart';

class PeriodCalculator extends StatelessWidget {
  const PeriodCalculator({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit, CalculatorState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView(
            // shrinkWrap: true,
            physics: const BouncingScrollPhysics(),

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
                          tabController.animateTo(7);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        )),
                    const Spacer(),
                    const Icon(
                      Icons.shopping_bag_sharp,
                      color: black,
                    ),
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
                  child: const Text(
                    "تتبع الدورة الشهرية",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.vertical(
                    top: const Radius.elliptical(50, 30),
                  ),
                ),
                child: Column(
                  children: [
                    const CalendarWidget(),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    const periodItem(
                      color: Color(0xff852727),
                      name: 'فترة الدورة',
                    ),
                    const periodItem(
                      color: Colors.deepOrange,
                      name: 'الدورة التالية',
                    ),
                    const periodItem(
                      color: Colors.black,
                      name: 'يوم الامان',
                    ),
                    const periodItem(
                      color: Colors.pinkAccent,
                      name: 'يوم الامان',
                    ),
                    const periodItem(
                      color: Color(0xff0312E5),
                      name: 'فترة الخصوبة',
                    ),
                    const periodItem(
                      color: Colors.yellow,
                      name: 'يوم التبويض',
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: w * 0.4,
                            height: h * 0.09,
                            child: const Card(
                              color: kPrimaryColor2,
                              elevation: 2,
                              child: Center(
                                child: Icon(
                                  Icons.print,
                                  color: darkGrey2,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      endIndent: 15,
                      indent: 15,
                      color: darkGrey2,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "أعراضك",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "تدفق الحيض",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                          groupValue:
                          CalculatorCubit.get(context).groupValueOne,
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
                          groupValue:
                          CalculatorCubit.get(context).groupValueOne,
                        ),
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
                          groupValue:
                          CalculatorCubit.get(context).groupValueOne,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "الأعراض",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
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
                          groupValue:
                          CalculatorCubit.get(context).groupValueTow,
                        ),
                        ItemWidget(
                          name: 'تشنجات',
                          value: 2,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectTow(value);
                          },
                          groupValue:
                          CalculatorCubit.get(context).groupValueTow,
                        ),
                        ItemWidget(
                          name: 'كل شيء على ما يرام',
                          value: 3,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectTow(value);
                          },
                          groupValue:
                              CalculatorCubit.get(context).groupValueTow,
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
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "المزاج",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
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
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
                        ),
                        ItemWidget(
                          name: 'تعب واكتآب',
                          value: 2,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectThree(value);
                          },
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
                        ),
                        ItemWidget(
                          name: 'جيد',
                          value: 3,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectThree(value);
                          },
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
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
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
                        ),
                        ItemWidget(
                          name: 'تقلب المزاج',
                          value: 5,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectThree(value);
                          },
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
                        ),
                        ItemWidget(
                          name: 'غضب وانفعال',
                          value: 6,
                          onChanged: (value) {
                            CalculatorCubit.get(context).selectThree(value);
                          },
                          groupValue:
                              CalculatorCubit.get(context).groupValueThree,
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
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "تتبع الإباضة",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "فرصة حدوث حمل مرتفع هو يوم:17",
                          style: TextStyle(fontSize: 12, color: darkGrey2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class periodItem extends StatelessWidget {
  const periodItem({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Spacer(),
          Text(name),
          Icon(
            Icons.circle,
            color: color,
            size: 12,
          ),
        ],
      ),
    );
  }
}
