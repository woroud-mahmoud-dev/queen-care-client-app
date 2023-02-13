
import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

Widget ConsultationTextField({

  required String hintText,
  required double h,
  required double w,
  required int maxLines,
  String? Function(String?)? validate,
  required TextEditingController controller,
  context,




  Function()? onEditingComplete,
}) {
  return SizedBox(
    height: h,
    width: w,

    child: TextFormField(
      maxLines: maxLines,
      textInputAction: TextInputAction.send,
      keyboardType: TextInputType.text,

      onEditingComplete: onEditingComplete,
      controller: controller,
      validator: validate,

      decoration: InputDecoration(

        hintText:hintText ,

        prefixIconColor: kPrimaryColor,


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