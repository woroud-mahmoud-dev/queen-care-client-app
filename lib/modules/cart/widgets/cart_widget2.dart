import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';

class CartWidget2 extends StatelessWidget {
  final CartModel cartModel;
  final List<int> numberOfItems;
  final int productId;

  const CartWidget2({super.key,

    required this.cartModel,
    required this.productId,
    required this.numberOfItems,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Card(
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
                            cartModel.mission.name,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: FittedBox(
                          child: Text(
                            '${cartModel.mission.price}  x  ${numberOfItems[productId]}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 12, color: kPrimaryColor),
                          ),
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
