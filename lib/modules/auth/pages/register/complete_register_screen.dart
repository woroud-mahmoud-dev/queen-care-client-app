import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_cubit.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/modules/home/main_screen.dart';
class CompleteRegisterScreen extends StatelessWidget {
  CompleteRegisterScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  MyService myService = MyService();
  var formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            showToast(text: ' تم انشاء الحساب بنجاح', color: Colors.green);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => MainScreen()),
                    (route) => false);
          }

          if (state is RegisterErrorState) {
            showToast(text: state.error, color: Colors.red);
          }
          if (state is NumberUsedState) {
            showToast(text: state.error, color: Colors.amber);
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
                  const TitleWidget(text: 'تسجيل'),
                  const SizedBox(
                    height: 50,
                  ),
                  const BigTitle(
                    text: 'تسجيل الحساب',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Description1(text: 'أكمل التفاصيل الخاصة بك'),
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
                                } else {
                                  return null;
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
                                } else {
                                  return null;
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
                                } else {
                                  return null;
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
                                } else {
                                  return null;
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
                                } else {
                                  return null;
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
                                } else {
                                  return null;
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
                                  return 'Address is Required ';
                                } else {
                                  return null;
                                }
                              },
                              label: 'العنوان',
                              hintText: 'سجل عنوانك',
                              isPassword: false,
                              icon: const Icon(
                                Icons.location_on,
                                color: kPrimaryColor,
                              ),
                              controller: addressController,
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
                                } else if (value.length < 6) {
                                  return 'Password must be 6 characters at least';
                                } else {
                                  return null;
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
                                  return 'Confirm Password is Required ';
                                } else {
                                  if (passwordController.text.trim() !=
                                      confirmPasswordController.text.trim()) {
                                    return 'Password  and confirm password do not match ';
                                  } else {
                                    return null;
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
                              controller: confirmPasswordController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.05,
                          ),
                          TextFormField(
                            enabled: true,
                            style: const TextStyle(color: Colors.black),
                            readOnly: true,
                            validator: (input) {
                              if (RegisterCubit.get(context).birthdayDateTime ==
                                  null) {
                                return 'BirthDate is  Required ';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              enabled: false,
                              hintText:
                              RegisterCubit.get(context).birthdayDateTime ==
                                  null
                                  ? 'اختر تاريخ ميلادك'
                                  : formattedDate,
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIconColor: kPrimaryColor,
                              label: const Text(
                                'تاريخ الميلاد',
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: kPrimaryColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                const BorderSide(color: kPrimaryColor),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                              suffix: GestureDetector(
                                onTap: () async {

                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: dateTime,
                                    firstDate: DateTime(1990, 1, 1),
                                    lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary:
                                            kPrimaryColor, // <-- SEE HERE
                                            onPrimary:
                                            Colors.black, // <-- SEE HERE
                                            onSurface:
                                            Colors.black, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors
                                                  .grey, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  // ignore: use_build_context_synchronously
                                  RegisterCubit.get(context)
                                      .selectBirthdayDateTime(newDate!);
                                  if (newDate != null) {
                                    formattedDate = DateFormat('yyyy-MM-dd')
                                        .format(newDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16

                                  } else {}
                                },
                                child: const Icon(
                                  Icons.calendar_today_rounded,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
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
                                  RegisterCubit.get(context).selectGender(val);
                                },
                              ),
                              GenderWidget(
                                groupValue:
                                RegisterCubit.get(context).genderGroupValue,
                                icon: Icons.woman,
                                name: 'Female',
                                value: 0,
                                onChanged: (val) {
                                  RegisterCubit.get(context).selectGender(val);
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
                                        fontSize: 10),
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
                        RegisterCubit.get(context).check();
                      }
                      if (formKey.currentState!.validate() &&
                          RegisterCubit.get(context).genderGroupValue !=
                              null) {
                        debugPrint(email);
                        RegisterCubit.get(context).registerUser(
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          address: addressController.text.trim(),
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
                  const Description12(
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