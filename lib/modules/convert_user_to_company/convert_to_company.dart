import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/screen_title.dart';
import 'package:queen_care/core/widget/missing_info_snack_bar.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/title_widget.dart';
import 'package:queen_care/modules/convert_user_to_company/convert_done.dart';
import 'package:queen_care/modules/convert_user_to_company/cubit/register_company_cubit.dart';
import 'package:queen_care/modules/convert_user_to_company/widget/company_info_form.dart';

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
      create: (context) => RegisterCompanyCubit()..initLocation()..getLocation(),
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
                  SizedBox(height: h * 0.03),
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
                  SizedBox(height: h * 0.02),
                  CompanyInfoForm(
                    nameController: nameController,
                    h: h,
                    addressController: addressController,
                    idNumberController: idNumberController,
                    formKey: companyFormKey,
                  ),
                  SizedBox(height: h * 0.02),
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
