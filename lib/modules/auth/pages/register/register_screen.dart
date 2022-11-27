import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/register/complet_register_screen.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_cubit.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterStates>(
  listener: (context, state) {

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
            Form(
              key: formKey,
              child: customTextField(
                  keyboardType: TextInputType.emailAddress,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return 'Email is Required ';
                    }
                    if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value)) {
                      return 'Please enter a valid Email';
                    }
                  },
                  label: 'الايميل',
                  hintText: 'الايميل',
                  isPassword: false,
                  icon: const Icon(
                    Icons.email_outlined,
                    color: kPrimaryColor,
                  ),
                  controller: emailController,
                  context: context,
                  onEditingComplete: () {
                    if(formKey.currentState!.validate()){

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => CompletRegisterScreen(
                            email: emailController.text.trim(),

                          )));
                    }

                  }),
            ),
            SizedBox(
              height: h * 0.2,
            ),
            AuthButton(
              title: 'اكمال التسجيل ',
              onTap: () {
                if(formKey.currentState!.validate()){

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CompletRegisterScreen(
                        email: emailController.text.trim(),

                      )));
                }

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
  },
),
);
  }
}
