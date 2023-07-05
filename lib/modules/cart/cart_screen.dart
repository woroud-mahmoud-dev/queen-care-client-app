import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/widgets/custom_buy_card.dart';
import 'package:queen_care/modules/cart/widgets/show_products_part.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);
  MyService myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int allMoney = 0;
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubit()..getAllCartsProduct(),
        child: BlocConsumer<CartCubit, CartState>(listener: (context, state) {
          if (state is DecreaseProductNumberState ||
              state is IncreaseProductNumberState) {
            CartCubit.get(context)
                .countAllMoney(CartCubit.get(context).allCartsProductsList);
          }
          if (state is DeviceNotConnectedToDeleteState) {
            showSnackBar(context);
          }
        }, builder: (context, state) {
          List<CartModel> allProducts =
              CartCubit.get(context).allCartsProductsList;
          allMoney = CartCubit.get(context).allMoney;
          return Container(
            width: w,
            height: h,
            decoration: customBoxDecoration,
            padding: const EdgeInsets.all(0.0),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'cart'.tr(context),
                      style: TextStyle(color: kPrimaryColor, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.2,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              state is GetAllProductsLoadingState
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: const LoadingWidget(),
                    )
                  : state is GetAllProductsErrorState
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          child: CustomErrorWidget(
                            onPressed: () {
                              CartCubit.get(context).getAllCartsProduct();
                            },
                          ),
                        )
                      : state is DeviceNotConnectedState
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: NoInternetWidget(
                                onPressed: () {
                                  CartCubit.get(context).getAllCartsProduct();
                                },
                              ),
                            )
                          : ShowCartProducts(
                              allOrders: allProducts,

                            ),
              const SizedBox(
                height: 20,
              ),
              CustomBuyCard(
                  allMoney: allMoney, allProducts: allProducts, w: w, h: h),
            ]),
          );
        }),
      ),
    );
  }
}
