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
import 'package:queen_care/modules/home/main_screen.dart';

class CompletRegisterScreen extends StatelessWidget {
  CompletRegisterScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmePassowrdController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime(2022, 12, 1);

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
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => MainScreen()),
                (route) => false);
          }

          if (state is RegisterErrorState) {
            showToast(text: ' حدث خطأ أثناء إنشاء الحساب', color: Colors.red);
          }
        },
        builder: (context, state) {
          DateTime birthDayDateTime =
              RegisterCubit.get(context).birthdayDateTime;

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
                  const Desecrption1(text: 'أكمل التفاصيل الخاصة بك'),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'First Name is Required ';
                                }
                              },
                              label: 'الاسم الأول',
                              hintText: 'سجل اسمك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.person_outline_outlined,
                                color: kPrimaryColor,
                              ),
                              controller: firstNameController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Last Name is Required ';
                                }
                              },
                              label: 'الاسم الأخير',
                              hintText: 'سجل اسمك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.person_outline_outlined,
                                color: kPrimaryColor,
                              ),
                              controller: lastNameController,
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
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Country is Required ';
                                }
                              },
                              label: 'البلد',
                              hintText: 'سجل اسم بلدك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.location_city,
                                color: kPrimaryColor,
                              ),
                              controller: countryController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'City is Required ';
                                }
                              },
                              label: 'المدينة',
                              hintText: 'سجل اسم مدينتك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.location_city,
                                color: kPrimaryColor,
                              ),
                              controller: cityController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Area is Required ';
                                }
                              },
                              label: 'المنطقة',
                              hintText: 'سجل اسم منطقتك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.location_city,
                                color: kPrimaryColor,
                              ),
                              controller: areaController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Adress is Required ';
                                }
                              },
                              label: 'العنوان',
                              hintText: 'سجل عنوانك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.location_on,
                                color: kPrimaryColor,
                              ),
                              controller: adressController,
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
                                } else {
                                  if (passwordController.text.trim() !=
                                      confirmePassowrdController.text.trim()) {
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
                          SizedBox(
                            height: h * 0.05,
                          ),
                          Container(
                            child: TextFormField(
                              enabled: true,
                              style: const TextStyle(color: Colors.black),
                              validator: (input) {},
                              decoration: InputDecoration(
                                hintText: 'اختر تاريخ ميلادك',
                                hintStyle: const TextStyle(color: Colors.black),
                                labelText: 'تاريخ الميلاد',
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber),
                                ),
                                labelStyle: const TextStyle(
                                    color: Colors.white, fontSize: 17),
                                suffix: GestureDetector(
                                  onTap: () async {
                                    birthDayDateTime = (await showDatePicker(
                                        context: context,
                                        initialDate: dateTime,
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2100)))!;

                                    // if 'cancle'=> null
                                    if (birthDayDateTime == null) {
                                      RegisterCubit.get(context)
                                          .selectBirthdayDateTime(
                                              birthDayDateTime);
                                    }
                                    return;
                                  },
                                  child: const Icon(
                                    Icons.calendar_today_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
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
                        ],
                      )),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  state is! RegisterLoadinglState
                      ? AuthButton(
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
                                firstName: firstNameController.text.trim(),
                                lastName: lastNameController.text.trim(),
                                address: adressController.text.trim(),
                                area: areaController.text.trim(),

                                country: countryController.text.trim(),
                                city: cityController.text.trim(),
                                phone: phoneController.text.trim(),
                                password: passwordController.text.trim(),
                                email: email,
                                gender: RegisterCubit.get(context)
                                    .genderGroupValue
                                    .toString(),
                              );
                            }
                            ;
                          },
                          color: kPrimaryColor,
                        )
                      : const Center(
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
