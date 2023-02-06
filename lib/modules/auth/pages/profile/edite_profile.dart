import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/gender_widget.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/user.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_cubite.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/profile_states.dart';
class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key}) : super(key: key);
  UserModel? user;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  MyService myService = MyService();
  DateTime dateTime = DateTime.now();
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileWithHttp(),
      child: BlocConsumer<ProfileCubit, ProfileCubitState>(
        listener: (context, state) {
          if (state is EditeProfileSuccess) {
            showToast(
                text: 'تم تحديث الملف الشخصي بنجاح ', color: Colors.green);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          user = ProfileCubit.get(context).user;

          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              width: w,
              height: h,
              child: state is GetProfileLoading
                  ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ))
                  : ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const BackButton(),
                      SizedBox(
                        width: w * 0.2,
                      ),
                      const TitleWidget(text: 'الحساب الشخصي'),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: h * 0.18,
                      width: h * 0.18,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffCCCCCC),
                                  borderRadius:
                                  BorderRadius.circular(5))),
                          Positioned(
                              right: -10,
                              bottom: -10,
                              child: GestureDetector(
                                child: SvgPicture.asset(
                                    'assets/icons/camera_icon.svg'),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.1),
                  customTextField(
                      keyboardType: TextInputType.name,

                      label: 'الاسم الأول',
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

                      label: 'الاسم الأخير',
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

                      label: 'رقم الهاتف',
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

                  customTextField(
                      keyboardType: TextInputType.name,

                      label: 'البلد',
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

                      label: 'المدينة',
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

                      label: 'المنطقة',
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

                      label: 'العنوان',
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
                                      primary: Colors
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
                      const Text(
                        ' التنبيهات',
                        style: TextStyle(color: darkGrey, fontSize: 16),
                      ),
                      Switch(
                        value: true,
                        onChanged: (va) {},
                        activeTrackColor: kPrimaryColor,
                        inactiveThumbColor: Colors.blueGrey,
                        thumbColor:
                        MaterialStateProperty.all(const Color(0xff8B8B8B)),
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
                    title: 'حفظ',
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
            ),
          );
        },
      ),
    );
  }
}
