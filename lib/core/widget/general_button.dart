import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                TextStyle(color: textColor ?? Colors.white, fontSize: 15.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

