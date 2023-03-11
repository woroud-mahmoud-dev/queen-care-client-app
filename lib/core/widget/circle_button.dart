import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class CircleButton extends StatelessWidget {
  final Icon myIcon;
  final GestureTapCallback onTap;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 43, width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),

          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(child: myIcon),
          ),
        ),
      ),
    );
  }
}