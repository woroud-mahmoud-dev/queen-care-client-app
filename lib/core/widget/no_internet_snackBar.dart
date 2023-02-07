import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/app_localization.dart';

void showSnackBar(BuildContext context) {
  SnackBar snackBar = SnackBar(
      content: Text('no_internet_message'.tr(context)),
        backgroundColor: kBlueGreen,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1000),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
}