import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/complete_buy_screen.dart';

class CustomBuyCard extends StatelessWidget {
  const CustomBuyCard({
    Key? key,
    required this.allMoney,
    required this.allProducts,
    required this.w,
    required this.h,
  }) : super(key: key);

  final int allMoney;
  final List<CartModel> allProducts;
  final double w;
  final double h;

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
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: darkGrey2,
              ),
              InkWell(
                onTap: () {
                  if (allProducts.isEmpty) {
                    showToast(
                        text: 'cart_empty'.tr(context), color: kBlueGreen);
                  } else {
                    if (allMoney > 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CompleteBuyScreen(
                                allProducts: allProducts,
                              )));
                    } else {
                      showToast(
                          text: 'choose_number'.tr(context), color: kBlueGreen);
                    }
                  }
                },
                child: SizedBox(
                  width: w * 0.42,
                  height: h * 0.06,
                  child: Card(
                    color: kPrimaryColor,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Center(
                        child: Text(
                          'complete_purchases'.tr(context),textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //must change this picture

              const Text(
                'المجموع',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$allMoney ليرة',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
