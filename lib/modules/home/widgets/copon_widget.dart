import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.onTap,
  }) : super(key: key);

  final double h;
  final double w;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: h * 0.11,
        width: w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kBlueGreen,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        "get_coupon".tr(context),
                        style: const TextStyle(color: kBlueGreen, fontSize: 14),
                      ),
                    ),
                    const Text(
                      '60%  ',
                      style: TextStyle(color: kBlueGreen, fontSize: 14),
                    ),
                  ],
                )),
            const Spacer(),
            Expanded(
                flex: 1,
                child: Container(
                  height: h * 0.09,
                  width: h * 0.09,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child: Image.asset('assets/images/copon.png')),
                )),
          ],
        ),
      ),
    );
  }
}
