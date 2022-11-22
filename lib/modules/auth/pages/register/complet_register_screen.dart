import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/verefication/verify_code.dart';

class CompletRegisterScreen extends StatelessWidget {
  CompletRegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePassowrdController = TextEditingController();
  TextEditingController adressController = TextEditingController();

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
              text: 'تسجيل الحساب',
            ),
            const SizedBox(
              height: 10,
            ),
            Desecrption1(text: 'أكمل التفاصيل الخاصة بك'),
            SizedBox(
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.name,
                validate: (v) {},
                label: 'الاسم الكامل',
                hintText: 'سجل اسمك',
                isPassword: false,
                icon: const Icon(
                  Icons.person_outline_outlined,
                  color: kPrimaryColor,
                ),
                controller: nameController,
                context: context,
                onEditingComplete: () {}),
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
            SizedBox(
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.text,
                validate: (v) {},
                label: 'تأكيد كلمة المرور',
                hintText: 'تأكيد كلمة المرور ',
                isPassword: false,
                icon: const Icon(
                  Icons.lock_outline,
                  color: kPrimaryColor,
                ),
                controller: confirmePassowrdController,
                context: context,
                onEditingComplete: () {}),
            SizedBox(
              height: h * 0.03,
            ),
            customTextField(
                keyboardType: TextInputType.text,
                validate: (v) {},
                label: 'العنوان',
                hintText: 'ادخل عنوانك',
                isPassword: false,
                icon: const Icon(
                  Icons.home_outlined,
                  color: kPrimaryColor,
                ),
                controller: adressController,
                context: context,
                onEditingComplete: () {}),
            SizedBox(
              height: h * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderWidget(
                  groupValue: '',
                  icon: Icons.man,
                  name: 'Male',
                  value: 1,
                  onChanged: (val) {
                    // RegisterCubit.get(context).selectgender(val);
                  },
                ),
                GenderWidget(
                  groupValue: '',
                  icon: Icons.woman,
                  name: 'Female',
                  value: 0,
                  onChanged: (val) {
                    // RegisterCubit.get(context).selectgender(val);
                  },
                ),
              ],
            ),
            SizedBox(
              height: h * 0.03,
            ),
            AuthButton(
              title: 'تأكيد',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => VerifyCode()));
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
