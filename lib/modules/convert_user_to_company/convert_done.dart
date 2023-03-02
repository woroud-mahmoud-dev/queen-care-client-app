import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/logo_image.dart';

class ConvertDone extends StatelessWidget {
  const ConvertDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        padding: const EdgeInsets.all(25),
        width: w,
        height: h,
        decoration: customBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h * 0.19.sp,
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                'converted'.tr(context),
                style: TextStyle(
                    fontSize: 17.sp,
                  // color: kPrimaryColor,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),


           Expanded(
             child: Text(
               textAlign: TextAlign.center,
               'convert_message'.tr(context),
               style: TextStyle(
                 fontSize: 16.sp
               ),
             ),
           ),
           Expanded(
             child: Text(
               textAlign: TextAlign.center,
               'convert_message2'.tr(context),
               style: TextStyle(
                 fontSize: 16.sp,
                 color: kBlueGreen,

               ),


             ),
           ),
            LogoImage(
              h: h * 0.3,
              w: w,
            ),
          ],
        ),
      ),
    );
  }
}
