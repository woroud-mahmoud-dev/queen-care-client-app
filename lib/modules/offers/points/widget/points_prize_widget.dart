import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class PointsPrizeWidget extends StatelessWidget {
  final String name;
  final double h;
  final void Function()? onTap;
  const PointsPrizeWidget({
    Key? key,
    required this.name,
    this.onTap,
    required this.h,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: h,
        child: Card(
          elevation: 5,
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
