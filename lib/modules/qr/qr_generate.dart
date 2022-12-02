
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrGenetate extends StatelessWidget {
  const QrGenetate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('امسح للحصول على هدية'),
            QrImage(
              data: 'hello ',
              version: QrVersions.auto,
              size: 250,
              gapless: false,
            ),


          ],
        ),
      ),
    );
  }
}
