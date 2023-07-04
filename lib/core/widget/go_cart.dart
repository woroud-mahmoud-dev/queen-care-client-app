import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';

import '../../modules/cart/cart_screen.dart';

class GoCart extends StatelessWidget {
  const GoCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => CartScreen()));
      },
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.shopping_bag_sharp,
                color: kPrimaryColor,
                size: 15,
              ),
              Expanded(
                  child: Text(
                    'complete_purchases'.tr(context),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryColor, fontSize: 8.sp),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
