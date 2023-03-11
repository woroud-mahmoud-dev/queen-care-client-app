import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
          child: Text(
            body,
            style: TextStyle(
              fontSize: 17.sp,
              color: kPrimaryColor,
            ),
          ),
        ),
        Center(
          child: CustomButton(
            title: 'Back'.tr(context),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) =>  MainScreen()),
                      (route) => false);
            },
            color: kPrimaryColor,
            width: 200.w,
            height: 60,
          ),
        ),
      ],
    );
  }
}
