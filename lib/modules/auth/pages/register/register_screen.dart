import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/auth_button.dart';
import 'package:queen_care/core/widget/description.dart';
import 'package:queen_care/core/widget/screen_title.dart';

import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/title_widget.dart';
import 'package:queen_care/modules/auth/pages/register/complete_register_screen.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_cubit.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit()..initLocation(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: w,
              height: h,
              decoration: customBoxDecoration,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  TitleWidget(text: 'sign_up'.tr(context)),
                  const SizedBox(
                    height: 50,
                  ),
                  ScreenTitle(
                    text: 'register_email'.tr(context),
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
                            return 'required_field'.tr(context);
                          }
                          if (!RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return 'v_email'.tr(context);
                          } else {
                            return null;
                          }
                        },
                        label: 'email'.tr(context),
                        hintText: 'enter_email'.tr(context),
                        isPassword: false,
                        icon: const Icon(
                          Icons.email_rounded,
                          color: kPrimaryColor,
                        ),
                        controller: emailController,
                        context: context,
                        onEditingComplete: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => CompleteRegisterScreen(
                                      email: emailController.text.trim(),
                                    )));
                          }
                        }),
                  ),
                  SizedBox(
                    height: h * 0.2,
                  ),
                  AuthButton(
                    title: 'complete_registration'.tr(context),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => CompleteRegisterScreen(
                                  email: emailController.text.trim(),
                                )));
                      }
                    },
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Description(
                    fontSize: 10,

                    text: 'c'.tr(context),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
