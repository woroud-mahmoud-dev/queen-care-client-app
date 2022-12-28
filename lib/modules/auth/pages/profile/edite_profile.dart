import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_cubite.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';

import 'cubit/profile_cubite.dart';



class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key}) : super(key: key);
  UserModel? user;
  TextEditingController nameController = TextEditingController();  TextEditingController phoneController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => ProfileCubit()..getProfileWithHttp(),
  child: BlocConsumer<ProfileCubit, ProfileCubitState>(
  listener: (context, state) {
    if(state is EditeProfileSuccess){
      showToast(text: 'تم تحديث الملف الشخصي بنجاح ', color: Colors.green);
      Navigator.pop(context);
    }


  },
  builder: (context, state) {
 user = ProfileCubit.get(context).user;

    return Scaffold(
      body:  Container(
        padding: const EdgeInsets.all(20),
        width: w,
        height: h,
        child:state is GetProfileLoading?const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            )): ListView(
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
                hintText: user!.firstName
                ,
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
            // customTextField(
            //     keyboardType: TextInputType.name,
            //     validate: (v) {},
            //     label: 'اسم العائلة',
            //     hintText: 'سجل اسم العائلة',
            //     isPassword: false,
            //     icon: const Icon(
            //       Icons.person_outline_outlined,
            //       color: kPrimaryColor,
            //     ),
            //     controller: nameController,
            //     context: context,
            //     onEditingComplete: () {}),
            // SizedBox(
            //   height: h * 0.03,
            // ),
            customTextField(
                keyboardType: TextInputType.phone,
                validate: (v) {},
                label: 'رقم الهاتف',
                hintText:user!.phone,
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
                hintText: user!.email,
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
            // customTextField(
            //     keyboardType: TextInputType.text,
            //     validate: (v) {},
            //     label: 'تأكيد كلمة المرور',
            //     hintText: 'تأكيد كلمة المرور ',
            //     isPassword: false,
            //     icon: const Icon(
            //       Icons.lock_outline,
            //       color: kPrimaryColor,
            //     ),
            //     controller: confirmPasswordController,
            //     context: context,
            //     onEditingComplete: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderWidget(
                  groupValue:
                  ProfileCubit.get(context).genderGroupValue,
                  icon: Icons.man,
                  name: 'Male',
                  value: 1,
                  onChanged: (val) {
                    ProfileCubit.get(context).selectgender(val);
                  },
                ),
                GenderWidget(
                  groupValue:
                  ProfileCubit.get(context).genderGroupValue,
                  icon: Icons.woman,
                  name: 'Female',
                  value: 0,
                  onChanged: (val) {
                    ProfileCubit.get(context).selectgender(val);
                  },
                ),

              ],
            ),

            SizedBox(
              height: h * 0.05,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const  Text(' التنبيهات',style: TextStyle(color: darkGrey,fontSize: 16),),
                Switch(value: true, onChanged: (va){},
                  activeTrackColor: kPrimaryColor,
                  inactiveThumbColor: Colors.blueGrey,
                  thumbColor: MaterialStateProperty.all(Color(0xff8B8B8B)),
                  inactiveTrackColor: Colors.grey,
                )

              ],
            ),
            SizedBox(
              height: h * 0.05,
            ),
            state is EditeProfileLoading?const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                )):     AuthButton(
              title: 'حفظ',
              onTap: () {
                print(nameController.text.isEmpty);
                ProfileCubit.get(context).editeProfileWithHttp(
                    gender:   ProfileCubit.get(context).genderGroupValue.toString(),

                    name: nameController.text, phone: phoneController.text, email: emailController.text, password: confirmPasswordController.text);

              },
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  },
),
);
  }
}