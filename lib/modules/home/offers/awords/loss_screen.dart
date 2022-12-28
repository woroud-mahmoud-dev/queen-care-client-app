import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';


class LossScreen extends StatelessWidget {
  const LossScreen({Key? key,})
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
                  'لقد خسرت',
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.07,
            ),

            SizedBox(
              height: h * 0.07,
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
