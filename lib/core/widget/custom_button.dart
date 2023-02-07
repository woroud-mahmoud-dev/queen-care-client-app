import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class GeneralButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  final Color? textColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final double? padding;
  const GeneralButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.textColor,
    this.elevation,
    this.margin,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: textColor == null ? kPrimaryColor : Colors.white.withAlpha(255),
        elevation: elevation ?? 3,
        margin: margin ?? EdgeInsets.zero,
        child: Padding(
          padding: padding == null
              ? const EdgeInsets.all(20.0)
              : EdgeInsets.all(padding!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:
                    TextStyle(color: textColor ?? Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color color;
  const AuthButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h*0.085,
        width: w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [
              0.3,
              0.8,
            ],
            colors: [
              Color(0xff8B1564),
              Color(0xffBB4594),
            ],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class HalfCircleButton1 extends StatelessWidget {
  final Icon myIcon;
  final void Function()? onTap;
  const HalfCircleButton1({
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

class AuthButton1 extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color color;
  const AuthButton1({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),

          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
