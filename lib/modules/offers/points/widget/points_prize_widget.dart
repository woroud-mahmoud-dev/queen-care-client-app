import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
class PointsPrizeWidget extends StatelessWidget {
  final String name;
  final void Function()? onTap;
  const PointsPrizeWidget({
    Key? key,
    required this.name,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(8.0),
        child: Text(
          name,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}