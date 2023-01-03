
import 'package:flutter/material.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/widgets/cart_widget.dart';
import 'package:queen_care/modules/cart/widgets/cart_widget2.dart';

class ShowCartProducts extends StatelessWidget {
  const ShowCartProducts({
    Key? key,
    required this.allOrders,
   required this.numberOfItems,
  }) : super(key: key);

  final List<CartModel> allOrders;

  final List<int> numberOfItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height* 0.7,
      child: ListView.builder(clipBehavior: Clip.hardEdge,
          physics:const BouncingScrollPhysics(),
          padding: EdgeInsets.all(15),

          shrinkWrap: true,
          itemBuilder: (BuildContext context, int int) {


            return CartWidget(
              productId: int,

              cartModel: allOrders[int], numberOfItems: numberOfItems,



            );
          },

          itemCount:allOrders.length// clientList.length//
      ),
    );
  }
}
class ShowCartProducts2 extends StatelessWidget {
  const ShowCartProducts2({
    Key? key,
    required this.allOrders,
 required this.numberOfItems,
  }) : super(key: key);

  final List<CartModel> allOrders;

  final List<int> numberOfItems;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height* 0.7,
      child: ListView.builder(clipBehavior: Clip.hardEdge,
          physics:const BouncingScrollPhysics(),
          padding: EdgeInsets.all(15),

          shrinkWrap: true,
          itemBuilder: (BuildContext context, int int) {


            return CartWidget2(
              productId: int,

              cartModel: allOrders[int], numberOfItems: numberOfItems,



            );
          },

          itemCount:allOrders.length// clientList.length//
      ),
    );
  }
}