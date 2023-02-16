import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/utils/constant.dart';

class Description1 extends StatelessWidget {
  final String text;

  const Description1({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 13.0, color: darkGrey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Description12 extends StatelessWidget {
  final String text;

  const Description12({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 10.0, color: darkGrey),
      textAlign: TextAlign.center,
    );
  }
}

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class CustomTitleWidget extends StatelessWidget {
  final String text;
  const CustomTitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style:  TextStyle(fontSize: 18.sp, color: darkGrey),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style:  TextStyle(fontSize: 15.sp, color: darkGrey),
      ),
    );
  }
}
