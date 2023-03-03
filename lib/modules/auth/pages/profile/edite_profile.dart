// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_cubit.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  UserModel? user;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final areaController = TextEditingController();
  final myService = MyService();
  DateTime dateTime = DateTime.now();
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProfileCubit()..getProfileWithHttp(),
        child: BlocConsumer<ProfileCubit, ProfileCubitState>(
          listener: (context, state) {
            if (state is EditeProfileSuccess) {
              showToast(text: 'profile_updated'.tr(context), color: kBlueGreen);
              Navigator.pop(context);
            }
            if (state is EditeProfileError) {
              showErrorSnackBar(context);
            }
            if (state is DeviceNotConnectedToSendState) {
              showSnackBar(context);
            }
          },
          builder: (context, state) {
            user = ProfileCubit.get(context).user;
            if( state is GetProfileLoading){
              return const Center(child: LoadingWidget());
            }else if(state is GetProfileError){
              return Center(
                child: CustomErrorWidget(
                  onPressed: () {
                    ProfileCubit.get(context).getProfileWithHttp();
                  },
                ),
              );
            }else if (state is DeviceNotConnectedState){
              return  Center(
                child: NoInternetWidget(
                  onPressed: () {
                    ProfileCubit.get(context)
                        .getProfileWithHttp();
                  },
                ),
              );
            }else{
              return Container(
                padding: const EdgeInsets.all(20),
                width: w,
                height: h,
                decoration: customBoxDecoration,
                child:ListView(
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        const BackButton(),
                        SizedBox(
                          width: w * 0.15,
                        ),
                        TitleWidget(
                            text: 'edite_profile'.tr(context)),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    LogoImage(
                      w: w * 0.5,
                      h: h * 0.2,
                    ),
                    SizedBox(height: h * 0.03),
                    customTextField(
                        keyboardType: TextInputType.name,
                        label: 'f_name'.tr(context),
                        hintText: user!.firstName,
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
                        label: 'l_name'.tr(context),
                        hintText: user!.lastName,
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
                        label: 'phone'.tr(context),
                        hintText: user!.phone,
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
                        label: 'email'.tr(context),
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
                    customTextField(
                        keyboardType: TextInputType.name,
                        label: 'country'.tr(context),
                        hintText: user!.country,
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
                        label: 'city'.tr(context),
                        hintText: user!.city,
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
                        label: 'area'.tr(context),
                        hintText: user!.area,
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
                        label: 'address'.tr(context),
                        hintText: user!.address,
                        isPassword: false,
                        icon: const Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                        ),
                        controller: addressController,
                        context: context,
                        onEditingComplete: () {}),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    TextFormField(
                      enabled: true,
                      style: const TextStyle(color: Colors.black),
                      readOnly: true,
                      decoration: InputDecoration(
                        enabled: false,
                        hintText: ProfileCubit.get(context)
                            .birthdayDateTime ==
                            null
                            ? '${user!.birthday.year}-${user!.birthday.month}-${user!.birthday.day}'
                            : '${ProfileCubit.get(context).birthdayDateTime!.year}-${ProfileCubit.get(context).birthdayDateTime!.month}-${ProfileCubit.get(context).birthdayDateTime!.day}',
                        hintStyle:
                        const TextStyle(color: Colors.black),
                        prefixIconColor: kPrimaryColor,
                        label: Text(
                          'birt_date'.tr(context),
                          style:
                          const TextStyle(color: kPrimaryColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: kPrimaryColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: kPrimaryColor),
                        ),
                        labelStyle: const TextStyle(
                            color: Colors.white, fontSize: 17),
                        suffix: GestureDetector(
                          onTap: () async {
                            DateTime? newDate =
                            await showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: DateTime(1990, 1, 1),
                              lastDate: DateTime.now(),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme:
                                    const ColorScheme.light(
                                      primary:
                                      kPrimaryColor, // <-- SEE HERE
                                      onPrimary: Colors
                                          .black, // <-- SEE HERE
                                      onSurface: Colors
                                          .black, // <-- SEE HERE
                                    ),
                                    textButtonTheme:
                                    TextButtonThemeData(
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
                            ProfileCubit.get(context)
                                .selectBirthdayDateTime(newDate!);
                            if (newDate != null) {
                              formattedDate =
                                  DateFormat('yyyy-MM-dd')
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
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        GenderWidget(
                          groupValue: ProfileCubit.get(context)
                              .genderGroupValue,
                          icon: Icons.man,
                          name: 'male'.tr(context),
                          value: 1,
                          onChanged: (val) {
                            ProfileCubit.get(context)
                                .selectGender(val);
                          },
                        ),
                        GenderWidget(
                          groupValue: ProfileCubit.get(context)
                              .genderGroupValue,
                          icon: Icons.woman,
                          name: 'female'.tr(context),
                          value: 0,
                          onChanged: (val) {
                            ProfileCubit.get(context)
                                .selectGender(val);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'notifications'.tr(context),
                          style: const TextStyle(
                              color: darkGrey, fontSize: 16),
                        ),
                        Switch(
                          value: true,
                          onChanged: (va) {},
                          activeTrackColor: kPrimaryColor,
                          inactiveThumbColor: Colors.blueGrey,
                          thumbColor: MaterialStateProperty.all(
                              const Color(0xff8B8B8B)),
                          inactiveTrackColor: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    state is EditeProfileLoading
                        ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ))
                        : AuthButton(
                      title: 'save'.tr(context),
                      onTap: () {
                        ProfileCubit.get(context)
                            .editeProfileWithHttp(
                          city: cityController.text.trim(),
                          country:
                          countryController.text.trim(),
                          area: areaController.text.trim(),
                          address:
                          addressController.text.trim(),
                          gender: ProfileCubit.get(context)
                              .genderGroupValue
                              .toString(),
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text,
                          email: emailController.text,
                        );
                      },
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              );
            }


          },
        ),
      ),
    );
  }
}
