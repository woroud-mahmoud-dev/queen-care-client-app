import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/core/widget/missing_info_snack_bar.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/modules/convert_user_to_company/convert_done.dart';
import 'package:queen_care/modules/convert_user_to_company/cubit/register_company_cubit.dart';
import 'package:queen_care/modules/convert_user_to_company/widget/company_info_form.dart';

// class ConvertToCompany extends StatefulWidget {
//   const ConvertToCompany({super.key});
//
//
//
//
//   @override
//   State<ConvertToCompany> createState() => _ConvertToCompanyState();
// }
//
// class _ConvertToCompanyState extends State<ConvertToCompany> {
//   final addressController = TextEditingController();
//
//   final idNumberController = TextEditingController();
//
//   final idNumberController2 = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     double w = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => ConvertToCompanyCubit(),
//         child: BlocConsumer<ConvertToCompanyCubit, ConvertToCompanyState>(
//           listener: (context, state) {
//             if (state is ConvertToCompanySuccess) {
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(builder: (_) => const ConvertDone()),
//                       (route) => false);
//             }
//           },
//           builder: (context, state) {
//             return SingleChildScrollView(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 width: w,
//                 height: h,
//                 decoration: customBoxDecoration,
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const BackButton(),
//                         SizedBox(
//                           width: w * 0.14,
//                         ),
//                         TitleWidget(
//                           text: 'Transfer_to_company'.tr(context),
//                         ),
//                         const Spacer(),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         'Choose_Type'.tr(context),
//                         style: TextStyle(fontSize: 14.sp),
//                       ),
//                     ),
//                     DropdownButton(
//                       icon: const SizedBox(),
//                       isExpanded: true,
//                       elevation: 20,
//                       alignment: Alignment.center,
//                       menuMaxHeight: 200,
//                       items: ConvertToCompanyCubit.get(context)
//                           .typesList
//                           .map((e) => DropdownMenuItem(
//                         value: e,
//                         child: Center(
//                           child: Text(
//                             e,
//                             style:
//                             const TextStyle(color: kPrimaryColor),
//                           ),
//                         ),
//                       ))
//                           .toList(),
//                       onChanged: (value) {
//                         ConvertToCompanyCubit.get(context)
//                             .convertToCompany(value.toString());
//                       },
//                       value: ConvertToCompanyCubit.get(context).type,
//                     ),
//                     SizedBox(height: h * 0.05.sp),
//                     Column(
//                       children: [
//                         customTextField(
//                             validate: (value) {
//                               return null;
//                             },
//                             keyboardType: TextInputType.name,
//                             label: 'address'.tr(context),
//                             hintText: 'address'.tr(context),
//                             isPassword: false,
//                             icon: const Icon(
//                               Icons.location_on,
//                               color: kPrimaryColor,
//                             ),
//                             controller: addressController,
//                             context: context,
//                             onEditingComplete: () {}),
//                         SizedBox(height: h * 0.03.sp),
//                         ConvertToCompanyCubit.get(context).isCompany
//                             ? customTextField(
//                             keyboardType: TextInputType.phone,
//                             label: 'Comm'.tr(context),
//                             hintText: 'Comm'.tr(context),
//                             isPassword: false,
//                             icon: const Icon(
//                               Icons.numbers,
//                               color: kPrimaryColor,
//                             ),
//                             validate: (value) {
//                               return null;
//                             },
//                             controller: idNumberController,
//                             context: context,
//                             onEditingComplete: () {})
//                             : Column(
//                           children: [
//                             Text(
//                               'have_Commercial'.tr(context),
//                               style: TextStyle(fontSize: 15.sp),
//                             ),
//                             Row(
//                               mainAxisAlignment:
//                               MainAxisAlignment.spaceAround,
//                               children: [
//                                 CustomRadioButton(
//                                   name: 'yes'.tr(context),
//                                   value: 1,
//                                   onChanged: (val) {
//                                     ConvertToCompanyCubit.get(context)
//                                         .hasRegisterSelect(val);
//                                   },
//                                   groupValue:
//                                   ConvertToCompanyCubit.get(context)
//                                       .hasRegister,
//                                 ),
//                                 CustomRadioButton(
//                                   name: 'no'.tr(context),
//                                   value: 0,
//                                   onChanged: (val) {
//                                     ConvertToCompanyCubit.get(context)
//                                         .hasRegisterSelect(val);
//                                   },
//                                   groupValue:
//                                   ConvertToCompanyCubit.get(context)
//                                       .hasRegister,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: h * 0.01),
//                             ConvertToCompanyCubit.get(context).hasRegister == 1
//                                 ? customTextField(
//                                 keyboardType: TextInputType.number,
//                                 label: 'Comm'.tr(context),
//                                 hintText: 'Comm'.tr(context),
//                                 isPassword: false,
//                                 icon: const Icon(
//                                   Icons.numbers,
//                                   color: kPrimaryColor,
//                                 ),
//                                 controller: idNumberController2,
//                                 context: context,
//                                 onEditingComplete: () {})
//                                 : const SizedBox(),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: h * 0.03,
//                     ),
//                     state is ConvertToCompanyLoading
//                         ? const Center(
//                         child: CircularProgressIndicator(
//                           color: kPrimaryColor,
//                         ))
//                         : AuthButton(
//                       title: 'save'.tr(context),
//                       onTap: () {
//                         ConvertToCompanyCubit.get(context)
//                             .registerCompany(
//                             idNumber: ConvertToCompanyCubit.get(
//                                 context)
//                                 .isCompany
//                                 ? idNumberController.text.toString()
//                                 : idNumberController2.text.toString(),
//                             address:
//                             ConvertToCompanyCubit.get(context)
//                                 .isCompany
//                                 ? addressController.text
//                                 : "");
//                       },
//                       color: kPrimaryColor,
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
class ConvertToCompany extends StatefulWidget {
  const ConvertToCompany({
    Key? key,
  }) : super(key: key);

  @override
  State<ConvertToCompany> createState() => _ConvertToCompanyState();
}

class _ConvertToCompanyState extends State<ConvertToCompany> {
  final addressController = TextEditingController();
  final companyFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => RegisterCompanyCubit(),
      child: BlocConsumer<RegisterCompanyCubit, RegisterCompanyState>(
        listener: (context, state) {
          if (state is CompleteCompanyInfoSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const ConvertDone()),
                (route) => false);
          }
          if (state is DeviceNotConnectedState) {
            showSnackBar(context);
          }
          if (state is CompleteCompanyInfoError) {
            showErrorSnackBar(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(20),
              width: w,
              height: h,
              decoration: customBoxDecoration,
              child: ListView(
                children: [
                  TitleWidget(
                    text: 'Transfer_to_company'.tr(context),
                  ),
                  SizedBox(height: h * 0.03.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose_Type'.tr(context),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: h * 0.01.sp),
                  SizedBox(height: h * 0.01.sp),
                  CompanyInfoForm(
                    nameController: nameController,
                    h: h,
                    addressController: addressController,
                    idNumberController: idNumberController,
                    formKey: companyFormKey,
                  ),
                  SizedBox(height: h * 0.02.sp),
                  state is CompleteCompanyInfoLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ))
                      : CustomButton(
                          title: 'save'.tr(context),
                          onTap: () {
                            if (RegisterCompanyCubit.get(context).type ==
                                null) {
                              showMissingInfoSnackBar(context);
                            } else {
                              if (companyFormKey.currentState!.validate()) {
                                RegisterCompanyCubit.get(context)
                                    .registerCompany(
                                        idNumber:
                                            idNumberController.text.toString(),
                                        address: addressController.text,
                                        name: nameController.text);
                              }
                            }
                          },
                          color: kPrimaryColor,
                          width: w * 0.5,
                          height: h * 0.07,
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
