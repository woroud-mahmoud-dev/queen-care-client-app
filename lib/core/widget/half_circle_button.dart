import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
class HalfCircleButton extends StatelessWidget {
  final Icon myIcon;
  final void Function()? onTap;
  const HalfCircleButton({
    Key? key,
    required this.onTap,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 20, width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
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
class HalfCircleButtonTop extends StatelessWidget {
  final Icon myIcon;
  final void Function()? onTap;
  const HalfCircleButtonTop({
    Key? key,
    required this.onTap,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 20, width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),
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