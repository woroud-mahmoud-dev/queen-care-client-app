import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_cubit.dart';
import 'package:queen_care/modules/auth/pages/login/cubit/login_states.dart';
import 'package:queen_care/modules/auth/pages/register/register_screen.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            debugPrint(state.toString());
            if (state is LoginSuccessState) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false);
            }

            if (state is LoginErrorState) {
              showToast(
                  text: "كلمة السر او رقم الهاتف غلط", color: kPrimaryColor);
            }
            if (state is DeviceNotConnectedState) {
              showSnackBar(context);
            }
          },
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              width: w,
              height: h,
              decoration: customBoxDecoration,
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
                      TitleWidget(text: 'sign_in'.tr(context)),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  BigTitle(
                    text: 'welcome_back'.tr(context),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Description1(text: 'login_message'.tr(context)),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          customTextField(
                              keyboardType: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'phone'.tr(context),
                              hintText: 'enter_phone'.tr(context),
                              isPassword: false,
                              icon: const Icon(
                                Icons.phone_android,
                                color: kPrimaryColor,
                              ),
                              controller: phoneController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.06,
                          ),
                          customTextField(
                              keyboardType: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'password'.tr(context),
                              hintText: 'enter_password'.tr(context),
                              isPassword: false,
                              icon: const Icon(
                                Icons.lock_outline,
                                color: kPrimaryColor,
                              ),
                              controller: passwordController,
                              context: context,
                              onEditingComplete: () {}),
                        ],
                      )),
                  SizedBox(
                    height: h * 0.07,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: LoginCubit.get(context).rememberMe,
                          checkColor: kPrimaryColor,
                          activeColor: Colors.grey,
                          fillColor: MaterialStateProperty.all(Colors.black12),
                          onChanged: (onChanged) {
                            LoginCubit.get(context).remember();
                          }),
                      Text(
                        'remember_me'.tr(context),
                        style: const TextStyle(
                          color: darkGrey,
                        ),
                      ),
                      const Spacer(),
                      // TextButton(
                      //     onPressed: () {
                      //       // Navigator.of(context).push(MaterialPageRoute(
                      //       //     builder: (_) => ForgetPassword()));
                      //     },
                      //     child: FittedBox(
                      //       child: Text(
                      //         'forget_password'.tr(context),
                      //         style: const TextStyle(
                      //             color: darkGrey,
                      //             decoration: TextDecoration.underline),
                      //       ),
                      //     )),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  state is LoginLoadingState
                      ? const LoadingWidget()
                      : AuthButton(
                          title: 'next'.tr(context),
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              debugPrint(' validate done !!!!');

                              LoginCubit.get(context).loginWithHttp(
                                  phone: phoneController.text.trim(),
                                  password: passwordController.text.trim());
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
                      Text(
                        'no_account'.tr(context),
                        style: const TextStyle(color: darkGrey, fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => Register()));
                          },
                          child: Text(
                            'sign_up'.tr(context),
                            style: const TextStyle(
                                color: kPrimaryColor, fontSize: 14),
                          )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
