import 'package:flutter/material.dart';

import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

import 'package:queen_care/modules/home/main_screen.dart';

class ReplaceDoneWidget extends StatelessWidget {
  const ReplaceDoneWidget({
    Key? key,
    required this.w,
    required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'تم استبدال نقاطك بنجاح',
                style: TextStyle(
                  color: darkGrey2,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Center(
          child: CustomButton(
            title: 'Back'.tr(context),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (_) => const MainScreen()),
                      (route) => false);
            },
            color: kPrimaryColor,
            width: w * 0.7,
            height: h * 0.07,
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}