import 'package:flutter/material.dart  ';
class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('no_internet_2.gif'),
      const  Text('لا يوجد اتصال بالانترنت ')
      ],
    );
  }
}
