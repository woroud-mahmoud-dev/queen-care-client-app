import 'package:flutter/material.dart';

import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/core/widget/loading_widget.dart';


class ScoreCalculateWidget extends StatelessWidget {
  const ScoreCalculateWidget({
    Key? key,
    required this.h,
  }) : super(key: key);

  final double h;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'score'.tr(context),
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: h * 0.3,
          ),
          const LoadingWidget()
        ],
      ),
    );
  }
}