import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

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
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: darkGrey2,
              ),
              onTap: () {
                tabController.animateTo(10);
              },
            ),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'points_ways'.tr(context),
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.07,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              'get_points'.tr(context),
              style: const TextStyle(
                  color: darkGrey2, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: h * 0.12,
          ),
          GeneralButton(
            onTap: () {
              tabController.animateTo(9);
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
