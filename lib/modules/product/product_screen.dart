import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';
import 'package:queen_care/modules/product/widgets/product_card_widget.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  final myService = MyService();
  @override
  Widget build(BuildContext context) {
    Color btColor =
        CacheHelper.getData(key: 'isFav') == true ? Colors.red : Colors.grey;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is AddToFavoriteSuccessState) {
            btColor = Colors.red;
            // showToast(
            //     text: 'المنتج تمت اضافته إلى المفضلة ', color: kBlueGreen);
          }
          if (state is DeleteFromFavoriteSuccessState) {
            btColor = Colors.grey;
          }
          if (state is AddToCartSuccessState) {
            showToast(
                text: 'added_to_the_cart'.tr(context), color: kBlueGreen);
          }
          if (state is AddToCartErrorState) {
            showToast(text: 'already_in_the_cart'.tr(context), color: kBlueGreen);
          }
          if (state is DeviceNotConnectedState) {
            showSnackBar(context);
          }
          if (state is DeleteFromFavoriteErrorsState ||
              state is AddToFavoriteErrorState) {
            showErrorSnackBar(context);
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
                    flex: 4,
                    child: ProductCardWidget(
                        state: state,
                        myService: myService,
                        btColor: btColor,
                        h: h,
                        w: w,
                        tabController: tabController),
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
