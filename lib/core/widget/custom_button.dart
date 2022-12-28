
import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';


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
    required this.title, this.textColor, this.elevation, this.margin, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: textColor ==null?kPrimaryColor:Colors.white.withAlpha(255),
        elevation: elevation ??3,
        margin: margin ?? EdgeInsets.zero,
        child: Padding(
          padding: padding==null? EdgeInsets.all(20.0): EdgeInsets.all(padding!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style:  TextStyle(color:textColor ?? Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class AuthButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color color;
  const AuthButton({
    Key? key,
    required this.onTap,
    required this.title, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: onTap,


        child: Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),

          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget{
  final Icon myicon;
  final GestureTapCallback onTap;
  const CircleButton({
    Key? key,
    required this.onTap,
    required this.myicon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: onTap,


        child: Container(
          height:43 ,width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100 ),
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),),),


          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child:
            Center(child: myicon),


          ),
        ),
      ),
    );

  }}
class halfCircleButton1 extends StatelessWidget{
  final Icon myicon;
  void Function()? onTap;
   halfCircleButton1({
    Key? key,
    required this.onTap,
    required this.myicon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,


        child: Container(
          height:20 ,width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,

            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              topRight: Radius.circular(100),),),


          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child:
            Center(child: myicon),


          ),
        ),
      ),
    );

  }}
class halfCircleButton extends StatelessWidget{
  final Icon myicon;
  void Function()? onTap;
   halfCircleButton({
    Key? key,
    required this.onTap,
    required this.myicon,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: onTap,


        child: Container(
          height:20 ,width: 25,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),),),


          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child:
            Center(child: myicon),


          ),
        ),
      ),
    );

  }}class AuthButton1 extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color color;
  const AuthButton1({
    Key? key,
    required this.onTap,
    required this.title, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: onTap,


        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color,
          ),

          // elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

