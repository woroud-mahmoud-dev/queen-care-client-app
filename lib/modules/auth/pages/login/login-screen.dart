import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/forget_password/forget_password.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                const title(text: 'تسجيل الدخول'),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const BigTitle(
              text: 'مرحبا بعودتك',
            ),
            const SizedBox(
              height: 10,
            ),
            const Desecrption1(
                text:
                    'قم بتسجل الدخول باستخدام \n الايميل وكلمة المرور أو رقم الهاتف '),
            SizedBox(
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.phone,
                validate: (v) {},
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
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.emailAddress,
                validate: (v) {},
                label: 'الايميل',
                hintText: 'الايميل',
                isPassword: false,
                icon: const Icon(
                  Icons.email_outlined,
                  color: kPrimaryColor,
                ),
                controller: emailController,
                context: context,
                onEditingComplete: () {}),
            SizedBox(
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.text,
                validate: (v) {},
                label: 'كلمة المرور',
                hintText: 'كلمة المرور',
                isPassword: false,
                icon: const Icon(
                  Icons.lock_outline,
                  color: kPrimaryColor,
                ),
                controller: passwordController,
                context: context,
                onEditingComplete: () {}),
            Row(
              children: [
                Checkbox(
                    value: false,
                    checkColor: kPrimaryColor,
                    onChanged: (onChanged) {}),
                const Text(
                  'تذكرني ',
                  style: TextStyle(
                    color: darkGrey,
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ForgetPassword()));
                    },
                    child: const Text(
                      'نيست رمز الدخول ',
                      style: TextStyle(
                          color: darkGrey,
                          decoration: TextDecoration.underline),
                    )),
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            AuthButton(
              title: 'المتابعة',
              onTap: () {},
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
