// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/period_calculator/cubit/calculator_cubit.dart';

class HowLongQuestion extends StatelessWidget {
  const HowLongQuestion({
    Key? key,
    required this.myService,
  }) : super(key: key);

  final MyService myService;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const SizedBox(),
      isExpanded: true,
      elevation: 20,
      alignment: Alignment.topCenter,
      menuMaxHeight: 200,
      items: [
        2, 3, 4, 5, 6, 7,

        // ignore: sort_child_properties_last
      ]
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  '$e' " " + "day".tr(context),
                  style: const TextStyle(color: kPrimaryColor),
                ),
              ))
          .toList(),
      onChanged: (value) {
        debugPrint('onChange $value');
        myService.setDaysNumber = value as int;
        CalculatorCubit.get(context).selectDurationOfTheMenstrualCycle(value);
      },
      value: CalculatorCubit.get(context).selectedIndexOfDays,
    );
  }
}
