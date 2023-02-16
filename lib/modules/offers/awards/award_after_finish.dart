import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class AwardAfterFinish extends StatelessWidget {
  const AwardAfterFinish({
    Key? key,
    required this.prizeModel,
  }) : super(key: key);
  final PrizeModel prizeModel;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    "${'congratulations'.tr(context)}  " + prizeModel.prize,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.07,
            ),
            Expanded(
              child: Image.asset(
                'assets/images/Gift.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: h * 0.07,
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
              height: h * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
