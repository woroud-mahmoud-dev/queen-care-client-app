import 'package:flutter/material.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';

import '../cubit/calculator_cubit.dart';

class HowManyDaysQuestion extends StatelessWidget {
  const HowManyDaysQuestion({
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
        21,
        22,
        23,
        24,
        25,
        26,
        27,
        28,
        29,
        30,
        31,
        32,
        33,
        34,
        35,
      ]
          .map((e) => DropdownMenuItem(
        value: e,
        child: Text(
          '$eيوم  ',
          style:
          const TextStyle(color: kPrimaryColor),
        ),
      ))
          .toList(),
      onChanged: (value) {
        myService.setHowLongPeriod = value as int;

        debugPrint('onChange $value');
        CalculatorCubit.get(context)
            .selectDurationBetweenOfTowMenstrualCycle(
            value);
      },
      value: CalculatorCubit.get(context).howLongPeriod,
    );
  }
}
