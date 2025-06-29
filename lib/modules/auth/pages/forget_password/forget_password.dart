import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/auth_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/description.dart';
import 'package:queen_care/core/widget/screen_title.dart';
import 'package:queen_care/modules/auth/pages/forget_password/confirm_password.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: w,
        height: h,
        decoration: customBoxDecoration,
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
                const ScreenTitle(text: 'نسيت رمز الدخول'),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const ScreenTitle(
              text: 'نسيت رمز الدخول',
            ),
            const SizedBox(
              height: 10,
            ),
            const Description(
              fontSize: 13,

                text:
                    'أدخل رقم الهاتف أدناه وسنرسل إليك \n رسالة نصية تحوي على رمز التحقق \nلتغيير كلمة المرور الخاصة بك  '),
            SizedBox(
              height: h * 0.15,
            ),
            customTextField(
                keyboardType: TextInputType.phone,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  } else {
                    return null;
                  }
                },
                label: 'رقم الهاتف',
                hintText: 'ادخل رقم هاتفك',
                isPassword: false,
                icon: const Icon(
                  Icons.phone_android,
                  color: kPrimaryColor,
                ),
                controller: phoneController,
                context: context,
                onEditingComplete: () {}),
            SizedBox(
              height: h * 0.15,
            ),
            AuthButton(
              title: 'تاكيد',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ConfirmPassword()));
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ليس لدي حساب ',
                  style: TextStyle(
                    color: darkGrey,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => Register()));
                    },
                    child: const Text(
                      'تسجيل',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
