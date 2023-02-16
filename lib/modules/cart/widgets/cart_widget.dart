import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';

class CartWidget extends StatelessWidget {
  final CartModel cartModel;
  final List<int> numberOfItems;

  final int productId;

  const CartWidget({
    super.key,
    required this.cartModel,
    required this.productId,
    required this.numberOfItems,
  });

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
                HalfCircleButton1(
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
            Container(
              margin: const EdgeInsets.all(3),
              height: 35,
              width: 25,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  numberOfItems[productId].toString(),
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
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
                      cartModel.mission.name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    '${cartModel.mission.price} ${"pounds".tr(context)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12.sp, color: kPrimaryColor),
                  ),
                ),
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
