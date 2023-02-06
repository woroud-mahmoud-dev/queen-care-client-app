import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/cart/cart_screen.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';
import 'package:queen_care/modules/product/widgets/counter_widget.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  // final ProductModel ? product;
  MyService myService = MyService();
  @override
  Widget build(BuildContext context) {
    Color btColor =
        myService.getSelectedProduct!.isfav == true ? Colors.red : Colors.grey;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is AddToFavoriteSuccessState) {
            btColor = Colors.red;
            showToast(
                text: 'المنتج تمت اضافته إلى المفضلة ', color: Colors.green);
          }
          if (state is DeleteFromFavoriteSuccessState) {
            btColor = Colors.grey;
          }
          if (state is AddToCartSuccessState) {
            showToast(
                text: 'المنتج تمت اضافته إلى السلة بنجاح', color: Colors.green);
          }
          if (state is AddToCartErrorState) {
            showToast(
                text: 'المنتج موجود مسبقاً في السلة', color: Colors.amber);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: h,
              width: w,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 5),
                          //   child: SvgPicture.asset(
                          //     'assets/icons/list.svg',
                          //     height: 20,
                          //   ),
                          // ),
                          const GoCart(),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                tabController.animateTo(4);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: black,
                              )),
                        ],
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: _buildSlider(),
                  // ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // height: h*0.3,
                      margin: const EdgeInsets.all(5),

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  imgUrl + myService.getSelectedProduct!.image),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
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
                            padding: const EdgeInsets.all(20.0),
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
                            height: h * 0.03,
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
                            height: h * 0.03,
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
                                        '${myService.getSelectedProduct!.price}ليرة  ',
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.03,
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
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: kPrimaryColor,
                                          ),
                                        )
                                      : SizedBox(
                                          width: w * 0.72,
                                          height: h * 0.1,
                                          child: Card(
                                            color: kPrimaryColor,
                                            elevation: 4,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      'إضافة إلى السلة ',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
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
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
