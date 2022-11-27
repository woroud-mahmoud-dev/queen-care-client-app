import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

Widget customTextField({
  required String label,
  required String hintText,
  required String? Function(String?)? validate,
  required TextEditingController controller,
  context,
  bool? isPassword,
  required TextInputType keyboardType,
  required Widget icon,
  Function()? onEditingComplete,
}) {
  return TextFormField(
    textInputAction: TextInputAction.send,
    keyboardType: keyboardType,
    keyboardAppearance: Brightness.light,
    onEditingComplete: onEditingComplete,
    controller: controller,
    validator: validate,
    obscureText: isPassword!,
    decoration: InputDecoration(
      suffix: icon,
      hintText:hintText ,
      prefixIconColor: kPrimaryColor,
      label: Text(
        label,
        style: TextStyle(color: kPrimaryColor),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: kPrimaryColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: kPrimaryColor),
      ),
    ),
  );
}


textButton(
    {required Function function,
      required String text,
      required Color color,
      required double fontSize}) {
  return TextButton(
      onPressed: function(),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
        ),
      ));
}

class newtextfield_widget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Icon icon;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  const newtextfield_widget({
    Key? key,
    required this.title,
    required this.controller,
    required this.icon,
    this.validate, this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextFormField(
          keyboardType: keyboardType,
          validator: validate,
          controller: controller,
          onChanged: (String value) {},
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
              hintText: title,
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: icon,
              ),
              border: InputBorder.none,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }
}
