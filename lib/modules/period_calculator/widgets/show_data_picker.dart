import 'package:flutter/material.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';

import '../cubit/calculator_cubit.dart';
Future<DateTime?> buildShowDatePicker(BuildContext context, DateTime dateTime) {
  return showDatePicker(
    context: context,
    initialDate: dateTime,
    firstDate: DateTime(1990, 1, 1),
    lastDate: DateTime.now(),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary:
            kPrimaryColor, // <-- SEE HERE
            onPrimary:
            Colors.black, // <-- SEE HERE
            onSurface:
            Colors.black, // <-- SEE HERE
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors
                  .grey, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
}