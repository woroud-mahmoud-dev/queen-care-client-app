import 'package:flutter/material.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';

class CustomTopWidget extends StatelessWidget {
  const CustomTopWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                color: black,
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
