import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/register/complet_register_screen.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

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
            const title(text: 'تسجيل'),
            const SizedBox(
              height: 50,
            ),
            const BigTitle(
              text: 'تسجيل الايميل ',
            ),
            SizedBox(
              height: h * 0.2,
            ),
            customTextField(
                keyboardType: TextInputType.emailAddress,
                validate: (v) {},
                label: 'الايميل',
                hintText: 'الايميل',
                isPassword: false,
                icon: const Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                controller: emailController,
                context: context,
                onEditingComplete: () {}),
            SizedBox(
              height: h * 0.2,
            ),
            AuthButton(
              title: 'اكمال التسجيل ',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => CompletRegisterScreen()));
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Desecrption2(
              text: 'من خلال الستمرار تأكيد موافقتك مع شروطنا',
            )
          ],
        ),
      ),
    );
  }
}
