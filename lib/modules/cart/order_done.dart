import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDone extends StatelessWidget {
  const OrderDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: customBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            Expanded(flex: 3, child: Image.asset('assets/images/done.png')),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'request'.tr(context),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'send_package'.tr(context),
                    style: TextStyle(
                      color: darkGrey2,
                      fontSize: 17.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            CustomButton(
              title: 'Back'.tr(context),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                    (route) => false);
              },
              color: kPrimaryColor,
              width: w * 0.4,
              height: h * 0.07,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
