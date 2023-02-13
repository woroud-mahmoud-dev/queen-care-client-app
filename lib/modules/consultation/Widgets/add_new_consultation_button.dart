
import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/modules/consultation/client/add_consultation.dart';

class AddNewConsultation extends StatelessWidget {
  const AddNewConsultation({
    Key? key,
    required this.w,
    required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        title: 'add_consulting'.tr(context),
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (_) => AddConsultation()),
          );
        },
        color: kPrimaryColor,
        width: w * 0.7,
        height: h * 0.07,
      ),
    );
  }
}