import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(
    {required String text,
      required Color color,
      Color? textColor,
      ToastGravity? toastGravity}) {
  return Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.SNACKBAR,


    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: textColor ?? Colors.white,

    fontSize: 13.0,
  );
}
