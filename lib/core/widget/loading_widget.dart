import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ));
  }
}