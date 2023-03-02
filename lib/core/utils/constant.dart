import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFBB4594);
const lightGrey = Color(0xffF7F7F7);
const kBlueGreen = Color(0xff35A3B5);
const darkGrey = Color(0xff8B8B8B);
const darkGrey2 = Color(0xff707070);
const darkGrey1 = Color(0xffC1B6B6);
const black = Color(0xff333333);
const kSecondaryColor = Color(0xFFffdb57);
const kGreen = Color(0xFF7ed958);

const customBoxDecoration = BoxDecoration(
  image: DecorationImage(
      colorFilter: ColorFilter.mode(Colors.white, BlendMode.softLight),
      image: AssetImage(
        'assets/images/background.png',
      ),
      fit: BoxFit.fill),
);

const customContainerBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(
    top: Radius.elliptical(50, 30),
  ),
  boxShadow: [
    BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 10),
  ],
);
