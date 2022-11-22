import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class Desecrption1 extends StatelessWidget {
  final String text;

  const Desecrption1({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(
          fontSize: 15.0,
          color: darkGrey
      ),),
    );
  }
}
class Desecrption2 extends StatelessWidget {
  final String text;

  const Desecrption2({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
        fontSize: 12.0,
        color: darkGrey
    ),textAlign: TextAlign.center,);
  }
}

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(
        fontSize: 28.0,

      ),),
    );
  }
}

class title extends StatelessWidget {
  final String text;
  const title({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(
          fontSize: 18.0,
          color: darkGrey
      ),),
    );
  }
}
