import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: kPrimaryColor),
        ));
  }
}
