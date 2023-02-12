import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

void showErrorSnackBar(BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text('error_message'.tr(context)),
    backgroundColor: kBlueGreen,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 1000),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}