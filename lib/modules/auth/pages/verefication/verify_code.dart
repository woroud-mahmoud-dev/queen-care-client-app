import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/global_widgets.dart';

// ignore: must_be_immutable
class VerifyCode extends StatelessWidget {
  VerifyCode({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final verifyController = TextEditingController();
  bool isLoading = false;
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: w,
        height: h,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const BackButton(),
                SizedBox(
                  width: w * 0.2,
                ),
                const title(text: 'رمز التفعيل'),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const BigTitle(
              text: 'رمز التفعيل ',
            ),
            const SizedBox(
              height: 10,
            ),
            const Desecrption1(
                text: 'أرسلنا رمزك إلى \n ستنتهي صلاحية هذا الرمز في الساعة '),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.center,
              child:  Text(
                '00:20',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 19,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Form(
                key: formKey,
                child: PinCodeTextField(
                  appContext: context,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: kPrimaryColor,
                  textStyle: const TextStyle(
                    color: darkGrey,
                  ),
                  pinTheme: PinTheme(
                    activeColor: kPrimaryColor,
                    inactiveColor: kPrimaryColor,
                    inactiveFillColor: Colors.grey[50],
                    shape: PinCodeFieldShape.box,
                    borderWidth: 0.8,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 60,
                    fieldWidth: 60,
                    activeFillColor: Colors.grey[50],
                    selectedFillColor: Colors.grey[50],
                    selectedColor: kPrimaryColor,
                    errorBorderColor: Colors.red,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: verifyController,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            AuthButton(
              title: 'تأكيد',
              onTap: () {},
              color: kPrimaryColor,
            ),
            SizedBox(
              height: h * 0.05,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'إعادة إرسال الكود',
                  style: TextStyle(
                      color: kPrimaryColor,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
      ),
    );
  }
}
