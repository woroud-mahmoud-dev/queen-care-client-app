import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مبروك لقد حصلت على هدية \n ${prizeModel.prize}',
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
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
            GeneralButton(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => MainScreen()),
                    (route) => false);
              },
              title: 'عودة إلى الرئيسية',
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 7,
              padding: 15,
            ),
            SizedBox(
              height: h * 0.07,
            ),
            // GeneralButton(
            //   onTap: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(
            //             builder: (_) =>
            //                 Home(tapId: 10)));
            //   },
            //   title: 'إضافة إلى نقاطي',
            //   margin: const EdgeInsets.symmetric(horizontal: 15),
            //   elevation: 7,
            //   padding: 15,
            // ),
            // SizedBox(
            //   height: h * 0.03,
            // ),
            // GeneralButton(
            //   onTap: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(
            //             builder: (_) =>
            //                 Home(tapId: 13)));
            //   },
            //   title: 'الحصول على الهدية',
            //   margin: const EdgeInsets.symmetric(horizontal: 15),
            //   elevation: 7,
            //   padding: 15,
            // ),
            SizedBox(
              height: h * 0.12,
            ),
          ],
        ),
      ),
    );
  }
}
