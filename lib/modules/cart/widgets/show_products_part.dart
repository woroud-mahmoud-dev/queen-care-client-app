import 'package:flutter/material.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/widgets/cart_widget.dart';
import 'package:queen_care/modules/cart/widgets/cart_purchases_widget.dart';

class ShowCartProducts extends StatelessWidget {
  const ShowCartProducts({
    Key? key,
    required this.allOrders,
  }) : super(key: key);

  final List<CartModel> allOrders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          clipBehavior: Clip.hardEdge,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(15),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int int) {
            return CartWidget(
              productId: int,
              cartModel: allOrders[int],
            );
          },
          itemCount: allOrders.length // clientList.length//
          ),
    );
  }
}
