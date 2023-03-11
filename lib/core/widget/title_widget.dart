import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/utils/constant.dart';




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
