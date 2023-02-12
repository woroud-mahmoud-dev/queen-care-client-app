
import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';
import 'package:queen_care/modules/product/widgets/counter_widget.dart';


class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
    required this.myService,
    required this.btColor,
    required this.h,
    required this.w,
    required this.tabController, required this.state,
  }) : super(key: key);

  final MyService myService;
  final Color btColor;
  final double h;
  final double w;
  final ProductState state;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  myService.getSelectedCategory!.name,
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (btColor == Colors.red) {
                      debugPrint('delet');

                      ProductCubit.get(context)
                          .deleteFromFavorite(
                          myService.getSelectedProduct!.id);
                    } else if (btColor == Colors.grey) {
                      debugPrint('Add');
                      ProductCubit.get(context).addToFavorite(
                          myService.getSelectedProduct!.id);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: btColor,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          SizedBox(
            width: w * 0.8,
            height: h * 0.1,
            child: GestureDetector(
              onTap: () {
                tabController.animateTo(6);
              },
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      myService.getSelectedProduct!.name,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          SizedBox(
            width: w * 0.8,
            height: h * 0.1,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text(
                    //   myService.getSelectedProduct!.price,
                    //   style: TextStyle(
                    //       color: kPrimaryColor, fontSize: 12),
                    // ),
                    Text(
                        "${myService.getSelectedProduct!.price}  ليرة ",
                        style: const TextStyle(
                            color: kBlueGreen,
                            fontSize: 14)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    ProductCubit.get(context).addToCart(
                        productId:
                        myService.getSelectedProduct!.id,
                        amount: ProductCubit.get(context)
                            .productNumber);
                  },
                  child: state is AddToCartLoadingState
                      ?  const LoadingWidget()
                      : SizedBox(
                    width: w * 0.7,
                    height: h * 0.09,
                    child: Card(
                      color: kPrimaryColor,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ) ,

                      elevation: 4,
                      child: Padding(
                        padding:
                        const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment
                                .spaceEvenly,
                            children:  [

                              Text(
                                'add_to_cart'.tr(context),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                              const      Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SelectInfoItem(
                  number:
                  ProductCubit.get(context).productNumber,
                  col: kPrimaryColor,
                  onPressAdd: () {
                    ProductCubit.get(context)
                        .increaseProductNumber();
                  },
                  onPressMin: () {
                    ProductCubit.get(context)
                        .decreaseProductNumber();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}