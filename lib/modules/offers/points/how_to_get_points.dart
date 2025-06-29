import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/widget/general_button.dart';

class HowToGetPoints extends StatelessWidget {
  final TabController tabController;
  const HowToGetPoints({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [

              InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: darkGrey2,
                ),
                onTap: () {
                  tabController.animateTo(10);
                },
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'points_ways'.tr(context),
                style:  TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.07,
          ),
          Row(
            children: [
              Text(
                'get_points'.tr(context),
                style:  TextStyle(
                    color: darkGrey2, fontSize: 14.sp, ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: h * 0.12,
          ),
          GeneralButton(
            onTap: () {
              tabController.animateTo(15);
            },
            title: 'general_co'.tr(context),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            elevation: 7,
            padding: 15,
          ),
          SizedBox(
            height: h * 0.05,
          ),
          GeneralButton(
            onTap: () {
              tabController.animateTo(0);
            },
            title: 'Buy_a_product'.tr(context),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            elevation: 7,
            padding: 15,
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
