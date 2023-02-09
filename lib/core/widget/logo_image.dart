import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key, required this.w, required this.h}) : super(key: key);
final double w;
final double h;
  @override
  Widget build(BuildContext context) {


    return  Image.asset('assets/images/logo.png',width: w,height: h,fit: BoxFit.contain,);
  }
}
