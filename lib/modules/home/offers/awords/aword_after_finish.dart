import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/home.dart';


class AwardAfterFinish extends StatelessWidget {
  const AwardAfterFinish({Key? key,})
      : super(key: key);

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
              height: h * 0.05 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[

                Text(
                  'مبروك لقد حصلت على هدية',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            Home(tapId: 10)));
              },
              title: 'إضافة إلى نقاطي',
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 7,
              padding: 15,
            ),
            SizedBox(
              height: h * 0.03,
            ),
            GeneralButton(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) =>
                            Home(tapId: 13)));
              },
              title: 'الحصول على الهدية',
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 7,
              padding: 15,
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
