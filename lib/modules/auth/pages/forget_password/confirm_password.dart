import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';

class ComfirmePassword extends StatelessWidget {
  ComfirmePassword({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();

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
                const title(text: 'تاكيد رمز الدخول '),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const BigTitle(
              text: 'تاكيد رمز الدخول ',
            ),
            const SizedBox(
              height: 10,
            ),
            const Desecrption1(
                text: 'الرجاء إدخال كلمة المرور الجديدة الخاصة بك'),
            SizedBox(
              height: h * 0.2,
            ),
            customTextField(
                keyboardType: TextInputType.phone,
                validate: (v) {},
                label: 'تأكيد كلمة المرور ',
                hintText: 'تأكيد كلمة المرور ',
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
