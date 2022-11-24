import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';

import 'package:queen_care/core/widget/global_widgets.dart';



class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();  TextEditingController phoneController = TextEditingController();

  TextEditingController confirmePassowrdController = TextEditingController();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const BackButton(),
                SizedBox(
                  width: w * 0.2,
                ),
                const title(text: 'الحساب الشخصي'),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(




                height: h* 0.18,
                width: h*0.18,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xffCCCCCC),
                            borderRadius: BorderRadius.circular(5))),
                    Positioned(
                        right: -10,
                        bottom: -10,
                        child: GestureDetector(
                          child: SvgPicture.asset('assets/icons/camera_icon.svg'),
                        )),

                  ],
                ),
              ),
            ),
            SizedBox(height: h*0.1),
            customTextField(
                keyboardType: TextInputType.name,
                validate: (v) {},
                label: 'الاسم الأول',
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
                keyboardType: TextInputType.name,
                validate: (v) {},
                label: 'اسم العائلة',
                hintText: 'سجل اسم العائلة',
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
              height: h * 0.05,
            ),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(' التنبيهات',style: TextStyle(color: darkGrey,fontSize: 16),),
    Switch(value: true, onChanged: (va){},
      activeTrackColor: kPrimaryColor,

    )

  ],
),
            SizedBox(
              height: h * 0.05,
            ),
            AuthButton(
              title: 'حفظ',
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (_) => CompletRegisterScreen()));
              },
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}