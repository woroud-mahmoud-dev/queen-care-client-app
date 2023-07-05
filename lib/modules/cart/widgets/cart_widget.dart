import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/circle_button.dart';
import 'package:queen_care/core/widget/half_circle_button.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;

  final int productId;

  CartWidget({
    super.key,
    required this.cartModel,
    required this.productId,
  });
  final myService = MyService();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 5),
        child: Row(
          children: [
            CircleButton(
              onTap: () {
                CartCubit.get(context).deleteFromCart(cartModel.mission.id);
              },
              myIcon: const Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 15,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                HalfCircleButtonTop(
                  onTap: () {
                    CartCubit.get(context).increaseProductNumber(productId);
                  },
                  myIcon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
                const SizedBox(height: 3),
                HalfCircleButton(
                  onTap: () {
                    CartCubit.get(context).decreaseProductNumber(productId);
                  },
                  myIcon: const Icon(
                    Icons.minimize,
                    color: Colors.white,
                    size: 10,
                  ),
                )
              ],
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(2),
                height: 35,
                width: 25,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  onChanged: (value) {
                    if (value == "" || value.isEmpty) {
                      CartCubit.get(context).setControllerValue(productId);
                    }
                  },
                  textAlign: TextAlign.center,
                  controller: myService.getTextControllersList![productId],
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  child: SizedBox(
                    width: w * 0.4,
                    child: Text(
                      CacheHelper.getData(key: 'LOCALE') == "en"
                          ? cartModel.mission.enName
                          : cartModel.mission.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 5),
                //   child: Text(
                //     '${cartModel.mission.price} ${"pounds".tr(context)}',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 12.sp, color: kPrimaryColor),
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                children: [
                  SizedBox(
                    width: w * 0.2,
                    child: CachedNetworkImage(
                      key: UniqueKey(),
                      imageUrl: imgUrl + cartModel.mission.image,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.transparent,
                        color: kPrimaryColor,
                        strokeWidth: 0.2,
                      )),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
