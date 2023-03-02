import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

Widget customTextField({
  required String label,
  required String hintText,
  String? Function(String?)? validate,
  required TextEditingController controller,
  context,
  bool? isPassword,
  required TextInputType keyboardType,
   Widget? icon,
  Function()? onEditingComplete,
}) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.width;
  return Container(
    height: h * 0.1,
    width: w * 0.9,
    color: Colors.white,
    child: TextFormField(
      textInputAction: TextInputAction.send,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      onEditingComplete: onEditingComplete,
      controller: controller,
      validator: validate,
      obscureText: isPassword!,
      decoration: InputDecoration(
        suffix: icon,
        hintText: hintText,
        prefixIconColor: kPrimaryColor,
        label: Text(
          label,
          style: const TextStyle(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
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

class NewTextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Icon icon;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  const NewTextFieldWidget({
    Key? key,
    required this.title,
    required this.controller,
    required this.icon,
    this.validate,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: icon,
              ),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }
}
