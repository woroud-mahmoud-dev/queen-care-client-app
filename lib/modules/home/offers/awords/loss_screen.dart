import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';


class LossScreen extends StatelessWidget {
  const LossScreen({Key? key, required this.points,})
      : super(key: key);
final double points;
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
              children: const[

                Text(
                  'لم يحالفك الحظ هذه المرة ',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
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
                    'تم إضافة ${points.round().toString()} نقطة إلى رصيدك ',
                    style: const TextStyle(
                        color: darkGrey2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),


            SizedBox(
              height: h * 0.2,
            ),

            GeneralButton(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(builder: (_)=> MainScreen()), (route) => false);

              },
              title: 'عودة إلى الرئيسية',
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 7,
              padding: 15,
            ),
            SizedBox(
              height: h * 0.03,
            ),

            SizedBox(
              height: h * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}
