import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/product.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';
import 'package:queen_care/modules/product/widgets/product_item.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class CategoryAllProducts extends StatefulWidget {
  const CategoryAllProducts({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  State<CategoryAllProducts> createState() => _CategoryAllProductsState();
}

class _CategoryAllProductsState extends State<CategoryAllProducts> {
  @override
  Widget build(BuildContext context) {
    final myService = MyService();

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit()..getAllProductsByTypeWithHttp(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is GetAllProductByTypeSuccess) {}
        },
        builder: (context, state) {
          List<ProductModel> allProductsByType =
              ProductCubit.get(context).productsListByType;
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(flex: 1, child: GoCart()),
                    SizedBox(
                      width: w/2,
                    ),
                        Expanded(
                          child: IconButton(
                              onPressed: () {
                                widget.tabController.animateTo(0);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: black,
                              )),
                        )
                      ],
                    ),
                  ),
                  LogoImage(
                    w: w,
                    h: h * 0.22,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            CacheHelper.getData(key: 'LOCALE') == "en"
                                ? myService.getSelectedCategory!.enName
                                : myService.getSelectedCategory!.name,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          const Spacer(),
                          // // const Text('4.5'),
                          // const Icon(
                          //   Icons.star,
                          //   color: Colors.amber,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
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
                      child: state is GetAllProductByTypeLoading
                          ? const LoadingWidget()
                          : state is DeviceNotConnectedState
                              ? NoInternetWidget(
                                  onPressed: () {
                                    ProductCubit.get(context)
                                        .getAllProductsByTypeWithHttp();
                                  },
                                )
                              : state is GetAllProductByTypeError
                                  ? CustomErrorWidget(
                                      onPressed: () {
                                        ProductCubit.get(context)
                                            .getAllProductsByTypeWithHttp();
                                      },
                                    )
                                  : state is Empty
                                      ? const SizedBox()
                                      : ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          itemCount: allProductsByType.length,
                                          itemBuilder: (context, int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myService.setSelectedProduct =
                                                      allProductsByType[index];
                                                  print(myService
                                                      .getSelectedProduct!
                                                      .name);
                                                  CacheHelper.saveData(
                                                      key: 'isFav',
                                                      value: allProductsByType[
                                                              index]
                                                          .isfav);
                                                  widget.tabController
                                                      .animateTo(5);
                                                });
                                              },
                                              child: ProductItem(
                                                w: w,
                                                h: h,
                                                tabController:
                                                    widget.tabController,
                                                productModel:
                                                    allProductsByType[index],
                                              ),
                                            );
                                          },
                                        ),
                    ),
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
