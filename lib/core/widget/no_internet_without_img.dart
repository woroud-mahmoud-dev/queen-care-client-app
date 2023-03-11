import 'package:flutter/material.dart  ';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
class NoInternetWidgetWithoutImage extends StatelessWidget {
  const NoInternetWidgetWithoutImage({Key? key, required this.onPressed}) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          'no_internet_message'.tr(context),
          style: const TextStyle(color: kPrimaryColor, fontSize: 14),
        ),
        IconButton(
            onPressed: onPressed,
            icon: const CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.refresh_outlined,
                color: kPrimaryColor,
              ),
            )),
        Text(
          'retry_again'.tr(context),
          style: const TextStyle(color: darkGrey, fontSize: 12),
        ),
      ],
    );
  }
}
