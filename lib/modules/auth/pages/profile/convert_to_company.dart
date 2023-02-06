import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/auth/pages/profile/cubit/convert_to_company_cubit.dart';
import 'package:queen_care/modules/auth/pages/profile/widgets/custom_radio_button.dart';

class ConvertToCompany extends StatefulWidget {
  ConvertToCompany({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<ConvertToCompany> createState() => _ConvertToCompanyState();
}

class _ConvertToCompanyState extends State<ConvertToCompany> {
  TextEditingController addressController = TextEditingController();

  TextEditingController idNumberController = TextEditingController();

  TextEditingController idNumberController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ConvertToCompanyCubit(),
      child: BlocConsumer<ConvertToCompanyCubit, ConvertToCompanyState>(
        listener: (context, state) {
          if (state is ConvertToCompanySuccess) {
            showToast(text: 'تم التحويل إلى شركة بنجاح', color: Colors.green);
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const BackButton(),
                        SizedBox(
                          width: w * 0.2,
                        ),
                        const TitleWidget(text: 'التحويل إلى شركة'),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'اختر النوع ',
                        style: TextStyle(fontSize: 14),
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
                                  validate: (value) {},
                                  keyboardType: TextInputType.name,
                                  label: 'العنوان',
                                  hintText: 'أدخل عنوان الشركة',
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
                                  label: 'رقم السجل التجاري',
                                  hintText: 'ادخل رقم سجلك التجاري',
                                  isPassword: false,
                                  icon: const Icon(
                                    Icons.numbers,
                                    color: kPrimaryColor,
                                  ),
                                  validate: (value) {},
                                  controller: idNumberController,
                                  context: context,
                                  onEditingComplete: () {}),
                            ],
                          )
                        : Column(
                            children: [
                              const Text('هل لديك سجل تجاري ؟'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CustomRadioButton(
                                    name: 'نعم',
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
                                    name: 'لا',
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
                                      label: 'رقم السجل التجاري',
                                      hintText: 'ادخل رقم سجلك التجاري',
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
                            title: 'حفظ',
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
