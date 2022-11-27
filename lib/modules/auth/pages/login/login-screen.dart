import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/forget_password/forget_password.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_cubite.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_states.dart';
import 'package:queen_care/modules/auth/pages/profile/profile.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';


class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    print(state);
    if ( state is  LoginSuccessState) {
      showToast(text: ' تم تسجيل الدخول بنجاح', color: Colors.green);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>Profile()), (route) => false);

    }

    if (state is LoginErrorState) {
      showToast(text: 'اسم المستخدم او كلمة المرور خطأ', color: Colors.red);
    }

  },
  builder: (context, state) {
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
                    'قم بتسجل الدخول باستخدام \n رقم الهاتف وكلمة المرور  '),
            SizedBox(
              height: h * 0.03,
            ),
            Form(
                key:formKey ,
                child: Column(children: [
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
                ],)),


            Row(
              children: [
                Checkbox(
                    value: LoginCubit.get(context).rememberMe,
                    checkColor: kPrimaryColor,
                    activeColor: Colors.grey,
                    // overlayColor:MaterialStateProperty.all(Colors.green),

                    fillColor: MaterialStateProperty.all(Colors.black12),

                    onChanged: (onChanged) {
                      LoginCubit.get(context).remember();

                    }),
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
       state is LoginLoadingState?const Center(
        child: CircularProgressIndicator(
        color: kPrimaryColor,
      )):     AuthButton(
              title: 'المتابعة',
              onTap: () {

                if (formKey.currentState!
                    .validate()) {
                  print(' validate done !!!!');
                  LoginCubit.get(context).loginWithHttp(
                      phone: phoneController.text
                          .trim(),
                      password: passwordController
                          .text
                          .trim());
                }
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
  },
),
);
  }
}
