import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_text_field.dart';
import 'package:queen_care/modules/convert_user_to_company/cubit/register_company_cubit.dart';
import '../../../core/widget/custom_radio_button.dart';

class CompanyInfoForm extends StatelessWidget {
  const CompanyInfoForm({
    Key? key,
    required this.nameController,
    required this.h,
    required this.addressController,
    required this.idNumberController,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final double h;
  final TextEditingController addressController;
  final TextEditingController idNumberController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadioButton(
                name: 'company'.tr(context),
                value: 'شركة',
                onChanged: (val) {
                  RegisterCompanyCubit.get(context).changeCompanyType(val);
                },
                groupValue: RegisterCompanyCubit.get(context).type,
              ),
              CustomRadioButton(
                name: 'shop'.tr(context),
                value: 'محل تجاري',
                onChanged: (val) {
                  RegisterCompanyCubit.get(context).changeCompanyType(val);
                },
                groupValue: RegisterCompanyCubit.get(context).type,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadioButton(
                name: 'supermarket'.tr(context),
                value: 'سوبر ماركت',
                onChanged: (val) {
                  RegisterCompanyCubit.get(context).changeCompanyType(val);
                },
                groupValue: RegisterCompanyCubit.get(context).type,
              ),
              CustomRadioButton(
                name: 'mall'.tr(context),
                value: "مول",
                onChanged: (val) {
                  RegisterCompanyCubit.get(context).changeCompanyType(val);
                },
                groupValue: RegisterCompanyCubit.get(context).type,
              ),
            ],
          ),
          customTextField(
              validate: (value) {
                if (value!.isEmpty) {
                  return 'required_field'.tr(context);
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              label: 'company_name'.tr(context),
              hintText: 'company_name'.tr(context),
              isPassword: false,
              controller: nameController,
              context: context,
              onEditingComplete: () {}),
          SizedBox(height: h * 0.02.sp),
          customTextField(
              keyboardType: TextInputType.name,
              label: 'address'.tr(context),
              hintText: 'address'.tr(context),
              isPassword: false,
              controller: addressController,
              context: context,
              validate: (value) {
                if (value!.isEmpty) {
                  return 'required_field'.tr(context);
                } else {
                  return null;
                }
              },
              onEditingComplete: () {}),
          SizedBox(height: h * 0.02.sp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'have_Commercial'.tr(context),
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(height: h * 0.02.sp),
              customTextField(
                keyboardType: TextInputType.number,
                label: 'Comm'.tr(context),
                hintText: 'Comm'.tr(context),
                isPassword: false,
                controller: idNumberController,
                context: context,
                validate: (value) {
                  if (value!.isEmpty) {
                    return null;
                  } else {
                    return null;
                  }
                },
                onEditingComplete: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'company_logo'.tr(context),
                style: TextStyle(fontSize: 15.sp),
              ),
              IconButton(
                  onPressed: () {
                    RegisterCompanyCubit.get(context)
                        .selectLogo(source: ImageSource.camera);
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    color: kPrimaryColor,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {
                    RegisterCompanyCubit.get(context)
                        .selectLogo(source: ImageSource.gallery);
                  },
                  icon: const Icon(
                    Icons.image_sharp,
                    color: kPrimaryColor,
                    size: 35,
                  )),
              RegisterCompanyCubit.get(context).selectedImage == null
                  ? Container()
                  : Expanded(
                      child: Container(
                        height: h * 0.12,
                        width: h * 0.12,
                        decoration: BoxDecoration(
                          border: Border.all(color: darkGrey),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: FileImage(File(
                                  RegisterCompanyCubit.get(context)
                                      .selectedImage!
                                      .path)),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
