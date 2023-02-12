import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class LossScreen extends StatelessWidget {
  const LossScreen({
    Key? key,
    required this.points,
  }) : super(key: key);
  final dynamic points;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'luck'.tr(context),
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.2,
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'تم إضافة ${double.parse(points).round()} نقطة إلى رصيدك ',
                    style: const TextStyle(
                      color: darkGrey2,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.2,
            ),
            Center(
              child: CustomButton(
                title: 'Back'.tr(context),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                      (route) => false);
                },
                color: kPrimaryColor,
                width: w * 0.7,
                height: h * 0.07,
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),

          ],
        ),
      ),
    );
  }
}
