import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/auth_button.dart';
import 'package:queen_care/core/widget/description.dart';
import 'package:queen_care/core/widget/screen_title.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/title_widget.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/area.dart';
import 'package:queen_care/models/city.dart';
import 'package:queen_care/models/country.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_cubit.dart';
import 'package:queen_care/modules/auth/pages/register/cubit/register_states.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class CompleteRegisterScreen extends StatelessWidget {
  CompleteRegisterScreen({Key? key, required this.email}) : super(key: key);
  final String email;
  String? formattedDate;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final myService = MyService();
  final formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit()..getCountries()..initLocation()..getLocation(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              // showToast(text: ' تم انشاء الحساب بنجاح', color: Colors.green);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const MainScreen()),
                  (route) => false);
            }

            if (state is RegisterErrorState) {
              showToast(text: state.error, color: kBlueGreen);
            }
            if (state is NumberUsedState) {
              showToast(text: state.error, color: kBlueGreen);
            }
            if (state is DeviceNotConnectedState) {
              showSnackBar(context);
            }
            if (state is ErrorState) {
              showErrorSnackBar(context);
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
                  TitleWidget(text: 'sign_up'.tr(context)),
                  const SizedBox(
                    height: 50,
                  ),
                  ScreenTitle(
                    text: 'register_account'.tr(context),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Description(
                      fontSize: 13, text: 'complete_details'.tr(context)),
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
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'f_name'.tr(context),
                              hintText: 'enter_name'.tr(context),
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
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'l_name'.tr(context),
                              hintText: 'enter_name'.tr(context),
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
                                  return 'required_field'.tr(context);
                                } else if (value.length < 9) {
                                  return 'valid_number'.tr(context);
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
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'country'.tr(context),
                              hintText: 'register_country'.tr(context),
                              isPassword: false,
                              icon: DropdownButton<Country>(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: RegisterCubit.get(context)
                                    .countries
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name),
                                        ))
                                    .toList(),
                                onChanged: (c) {
                                  RegisterCubit.get(context).selectCountry(c!);
                                },
                                value:
                                    RegisterCubit.get(context).selectedCountry,
                              ),
                              controller:
                                  RegisterCubit.get(context).countryController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'city'.tr(context),
                              hintText: 'register_city'.tr(context),
                              isPassword: false,
                              icon: DropdownButton<City>(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: RegisterCubit.get(context)
                                    .cities
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name),
                                        ))
                                    .toList(),
                                onChanged: (c) {
                                  RegisterCubit.get(context).selectCity(c!);
                                },
                                value: RegisterCubit.get(context).selectedCity,
                              ),
                              controller:
                                  RegisterCubit.get(context).cityController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty &&
                                    RegisterCubit.get(context)
                                        .areas
                                        .isNotEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'area'.tr(context),
                              hintText: 'register_area'.tr(context),
                              isPassword: false,
                              icon: DropdownButton<Area>(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: RegisterCubit.get(context)
                                    .areas
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.name),
                                        ))
                                    .toList(),
                                onChanged: (area) {
                                  RegisterCubit.get(context).selectArea(area!);
                                },
                                value: RegisterCubit.get(context).selectedArea,
                              ),
                              controller:
                                  RegisterCubit.get(context).areaController,
                              context: context,
                              onEditingComplete: () {}),
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.name,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  return null;
                                }
                              },
                              label: 'address'.tr(context),
                              hintText: 'register_address'.tr(context),
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
                                  return 'required_field'.tr(context);
                                } else if (value.length < 6) {
                                  return 'l_password'.tr(context);
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
                          SizedBox(
                            height: h * 0.03,
                          ),
                          customTextField(
                              keyboardType: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr(context);
                                } else {
                                  if (passwordController.text.trim() !=
                                      confirmPasswordController.text.trim()) {
                                    return 'c_password'.tr(context);
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              label: 'confirm_password'.tr(context),
                              hintText: 'confirm_password'.tr(context),
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
                                return 'required_field'.tr(context);
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              enabled: false,
                              hintText:
                                  RegisterCubit.get(context).birthdayDateTime ==
                                          null
                                      ? 'choose_birt_date'.tr(context)
                                      : formattedDate,
                              hintStyle: const TextStyle(color: Colors.black),
                              prefixIconColor: kPrimaryColor,
                              label: Text(
                                'birt_date'.tr(context),
                                style: const TextStyle(color: kPrimaryColor),
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
                                  color: Colors.black12, fontSize: 17),
                              suffix: GestureDetector(
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: dateTime,
                                    firstDate: DateTime(1900, 1, 1),
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
                                  // ignore: unnecessary_null_comparison
                                  if (newDate != null) {
                                    formattedDate = DateFormat('yyyy-MM-dd')
                                        .format(newDate);
                                    debugPrint(
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
                                name: 'male'.tr(context),
                                value: 1,
                                onChanged: (val) {
                                  RegisterCubit.get(context).selectGender(val);
                                },
                              ),
                              GenderWidget(
                                groupValue:
                                    RegisterCubit.get(context).genderGroupValue,
                                icon: Icons.woman,
                                name: 'female'.tr(context),
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
                                  child: Text(
                                    'required_field'.tr(context),
                                    style: const TextStyle(
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
                  state is! RegisterLoadingState
                      ? AuthButton(
                          title: 'confirm'.tr(context),
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
                                // area: areaController.text.trim(),
                                // country: countryController.text.trim(),
                                // city: cityController.text.trim(),
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
                      : const LoadingWidget(),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  Description(
                    text: 'c'.tr(context),
                    fontSize: 10,
                  ),
                  SizedBox(
                    height: h * 0.05,
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
