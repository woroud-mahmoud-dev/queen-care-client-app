import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class CartPurchases extends StatelessWidget {
  final CartModel cartModel;

  final int productId;

  CartPurchases({
    super.key,
    required this.cartModel,
    required this.productId,
  });
  final myService = MyService();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: w * 0.25,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        child: SizedBox(
                          width: w * 0.6,
                          child: Text(
                            CacheHelper.getData(key: 'LOCALE') == "en"
                                ? cartModel.mission.enName
                                : cartModel.mission.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            // Text(
                            //   cartModel.mission.price,
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 12.sp, color: kPrimaryColor),
                            // ),
                            // Text(
                            //   ' x  ',
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 12.sp, color: kPrimaryColor),
                            // ),
                            Text(
                              ' ${myService.getTextControllersList![productId].text.isEmpty ? "0" : myService.getTextControllersList![productId].text}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.sp, color: kPrimaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
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
