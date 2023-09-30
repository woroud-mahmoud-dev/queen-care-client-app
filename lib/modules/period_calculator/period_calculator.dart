import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';
import 'package:queen_care/modules/period_calculator/widgets/show_calender_and_details.dart';

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
            shrinkWrap: true,
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


                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'track'.tr(context),
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
              ShowCalenderAndDetails(h: h, w: w),
            ],
          );
        },
      ),
    );
  }
}
