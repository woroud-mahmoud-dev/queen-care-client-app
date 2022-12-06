import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_cubit.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/modules/home/home.dart';


class CompletRegisterScreen extends StatelessWidget {
  CompletRegisterScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePassowrdController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterStates>(
  listener: (context, state) {
    print(state);
    if (state is RegisterSuccessState) {
      showToast(text: ' تم انشاء الحساب بنجاح', color: Colors.green);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>const Home()), (route) => false);

    }


    if (state is RegisterErrorState
        ) {
      showToast(text: ' حدث خطأ أثناء إنشاء الحساب', color: Colors.red);
    }  },
  builder: (context, state) {
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
            Form(
                 key: formKey,
                child: Column(children: [
              customTextField(
                  keyboardType: TextInputType.name,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Name is Required ';
                    }
                  },
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
                  validate: (value) {

                    if (value!.isEmpty) {
                      return 'Phone is Required ';
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
                height: h * 0.03,
              ),
              customTextField(
                  keyboardType: TextInputType.text,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password is Required ';
                    }
                  },
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
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Password is Required ';

                    }else{
                      if(passwordController.text.trim() !=confirmePassowrdController.text.trim()){
                        return 'Password  and confirm password do not match ';
                      }
                    }

                  },
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
              // SizedBox(
              //   height: h * 0.03,
              // ),
              // customTextField(
              //     keyboardType: TextInputType.text,
              //     validate: (v) {},
              //     label: 'العنوان',
              //     hintText: 'ادخل عنوانك',
              //     isPassword: false,
              //     icon: const Icon(
              //       Icons.home_outlined,
              //       color: kPrimaryColor,
              //     ),
              //     controller: adressController,
              //     context: context,
              //     onEditingComplete: () {}),
              SizedBox(
                height: h * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenderWidget(
                    groupValue:
                    RegisterCubit.get(context).genderGroupValue,
                    icon: Icons.man,
                    name: 'Male',
                    value: 1,
                    onChanged: (val) {
                      RegisterCubit.get(context).selectgender(val);
                    },
                  ),
                  GenderWidget(
                    groupValue:
                    RegisterCubit.get(context).genderGroupValue,
                    icon: Icons.woman,
                    name: 'Female',
                    value: 0,
                    onChanged: (val) {
                      RegisterCubit.get(context).selectgender(val);
                    },
                  ),

                ],
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: RegisterCubit.get(context).visible,
                          child: const Text(
                            'please select your gender',
                            style: TextStyle(
                                color: Color.fromARGB(255, 205, 35, 23),
                                fontSize: 12),
                          )),
                    ],
                  ),

            ],)),

            SizedBox(
              height: h * 0.03,
            ),
            state is! RegisterLoadinglState
            ?  AuthButton(
              title: 'تأكيد',
              onTap: () {
                if (RegisterCubit.get(context).genderGroupValue ==
                    null) {
                  RegisterCubit.get(context).Check();
                }
                if (formKey.currentState!.validate() &&
                    RegisterCubit.get(context).genderGroupValue !=
                        null) {
                  print(email);
                  RegisterCubit.get(context).registerUser(
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                      password: passwordController.text.trim(),
                      email: email,
                      gender: RegisterCubit.get(context)
                          .genderGroupValue.toString());
                }
                ;

              },
              color: kPrimaryColor,
            )          : const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                )),
            SizedBox(
              height: h * 0.05,
            ),
            const Desecrption2(
              text: 'من خلال الستمرار تأكيد موافقتك مع شروطنا',
            )
          ],
        ),
      ),
    );
  },
),
);
  }
}
