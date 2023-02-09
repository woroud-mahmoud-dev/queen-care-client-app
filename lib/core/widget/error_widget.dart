import 'package:flutter/material.dart  ';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.onPressed})
      : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'error_message'.tr(context),
          style: const TextStyle(
            // color: kPrimaryColor,
              color: kBlueGreen,
            fontSize: 14
          ),
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh,
          // color: kPrimaryColor,

          color: kBlueGreen,        )),
      ],
    );
  }
}
