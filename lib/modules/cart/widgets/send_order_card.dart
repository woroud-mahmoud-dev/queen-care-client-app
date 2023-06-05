import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';

class SendOrderCard extends StatelessWidget {
  const SendOrderCard({
    Key? key,
    required this.allMoney,
    required this.noteController,
    required this.addressController,
    required this.list,
    required this.w,
    required this.h, required this.state,
  }) : super(key: key);

  final int allMoney;
  final TextEditingController noteController;
  final TextEditingController addressController;
  final List<Map<String, dynamic>> list;
  final double w;
  final double h;
  final  CartState state;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black38,
              spreadRadius: 0,
              blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          (state is AddOrderLoadingState ||
              state is AddOrderSuccessState)
              ? const Padding(
            padding: EdgeInsets.all(28.0),
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ),
          )
              :

          CustomButton(
            title: 'complete_purchases'.tr(context),
            onTap: () {
              CartCubit.get(context).addOrder(
                  note: noteController.text,
                  address: addressController.text,
                  list: list);
            },
            color: kPrimaryColor,
            width: w * 0.6,
            height: h * 0.07,
          ),
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     //must change this picture
          //
          //     Text(
          //       'the_sum'.tr(context),
          //       style:  TextStyle(
          //           color: Colors.grey,
          //           fontSize: 14.sp,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     Text(
          //       '$allMoney ${"pounds".tr(context)}',
          //       style:  TextStyle(
          //           color: Colors.black,
          //           fontSize: 10.sp,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}