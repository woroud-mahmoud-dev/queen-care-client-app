import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/convert_to_company_cubit.dart';
import 'package:queen_care/modules/auth/pages/profile/widgets/custom_radio_button.dart';

class ConvertToCompany extends StatefulWidget {
  const ConvertToCompany({Key? key, required this.tabController})
      : super(key: key);
  final TabController tabController;

  @override
  State<ConvertToCompany> createState() => _ConvertToCompanyState();
}

class _ConvertToCompanyState extends State<ConvertToCompany> {
  final addressController = TextEditingController();

  final idNumberController = TextEditingController();

  final idNumberController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ConvertToCompanyCubit(),
      child: BlocConsumer<ConvertToCompanyCubit, ConvertToCompanyState>(
        listener: (context, state) {
          if (state is ConvertToCompanySuccess) {
            showToast(text: 'converted'.tr(context), color: kBlueGreen);
            widget.tabController.animateTo(3);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: w,
                height: h,
                decoration: customBoxDecoration,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const BackButton(),
                        SizedBox(
                          width: w * 0.14,
                        ),
                        TitleWidget(
                          text: 'Transfer_to_company'.tr(context),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Choose_Type'.tr(context),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                    DropdownButton(
                      icon: const SizedBox(),
                      isExpanded: true,
                      elevation: 20,
                      alignment: Alignment.center,
                      menuMaxHeight: 200,
                      items: ConvertToCompanyCubit.get(context)
                          .typesList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                  child: Text(
                                    e,
                                    style:
                                        const TextStyle(color: kPrimaryColor),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        ConvertToCompanyCubit.get(context)
                            .convertToCompany(value.toString());
                      },
                      value: ConvertToCompanyCubit.get(context).type,
                    ),
                    SizedBox(height: h * 0.05),
                    ConvertToCompanyCubit.get(context).isCompany
                        ? Column(
                            children: [
                              customTextField(
                                  validate: (value) {
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
                                  label: 'address'.tr(context),
                                  hintText: 'address'.tr(context),
                                  isPassword: false,
                                  icon: const Icon(
                                    Icons.location_on,
                                    color: kPrimaryColor,
                                  ),
                                  controller: addressController,
                                  context: context,
                                  onEditingComplete: () {}),
                              SizedBox(height: h * 0.03),
                              customTextField(
                                  keyboardType: TextInputType.phone,
                                  label: 'Comm'.tr(context),
                                  hintText: 'Comm'.tr(context),
                                  isPassword: false,
                                  icon: const Icon(
                                    Icons.numbers,
                                    color: kPrimaryColor,
                                  ),
                                  validate: (value) {
                                    return null;
                                  },
                                  controller: idNumberController,
                                  context: context,
                                  onEditingComplete: () {}),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'have_Commercial'.tr(context),
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomRadioButton(
                                    name: 'yes'.tr(context),
                                    value: 1,
                                    onChanged: (val) {
                                      ConvertToCompanyCubit.get(context)
                                          .hasRegisterSelect(val);
                                    },
                                    groupValue:
                                        ConvertToCompanyCubit.get(context)
                                            .hasRegister,
                                  ),
                                  CustomRadioButton(
                                    name: 'no'.tr(context),
                                    value: 0,
                                    onChanged: (val) {
                                      ConvertToCompanyCubit.get(context)
                                          .hasRegisterSelect(val);
                                    },
                                    groupValue:
                                        ConvertToCompanyCubit.get(context)
                                            .hasRegister,
                                  ),
                                ],
                              ),
                              SizedBox(height: h * 0.03),
                              ConvertToCompanyCubit.get(context).hasRegister ==
                                      1
                                  ? customTextField(
                                      keyboardType: TextInputType.number,
                                      label: 'Comm'.tr(context),
                                      hintText: 'Comm'.tr(context),
                                      isPassword: false,
                                      icon: const Icon(
                                        Icons.numbers,
                                        color: kPrimaryColor,
                                      ),
                                      controller: idNumberController2,
                                      context: context,
                                      onEditingComplete: () {})
                                  : const SizedBox(),
                            ],
                          ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    state is ConvertToCompanyLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ))
                        : AuthButton(
                            title: 'save'.tr(context),
                            onTap: () {
                              ConvertToCompanyCubit.get(context)
                                  .registerCompany(
                                      idNumber: ConvertToCompanyCubit.get(
                                                  context)
                                              .isCompany
                                          ? idNumberController.text.toString()
                                          : idNumberController2.text.toString(),
                                      address:
                                          ConvertToCompanyCubit.get(context)
                                                  .isCompany
                                              ? addressController.text
                                              : "");
                            },
                            color: kPrimaryColor,
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
