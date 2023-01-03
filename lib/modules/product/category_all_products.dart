import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/models/product.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';


// ignore: must_be_immutable
class CategoryAllProducts extends StatelessWidget {
  CategoryAllProducts({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;
  MyService myService = MyService();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ProductCubit()..getAllProductsByTypeWithHttp(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<ProductModel> allProductsByType =
              ProductCubit.get(context).productsListByType;
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const GoCart(),

                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                tabController.animateTo(0);
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
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: h * 0.4,
                      width: w * 0.6,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            myService.getSelectedCategory!.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          const Text('4.5'),
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: kPrimaryColor2,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(50, 30),
                        ),
                      ),
                      child: state is GetAllProductByTypeLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              itemCount: allProductsByType.length,
                              itemBuilder: (context, int index) {
                                return ProductItem(
                                  w: w,
                                  h: h,
                                  tabController: tabController,
                                  productModel: allProductsByType[index],
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

// ignore: must_be_immutable
class ProductItem extends StatelessWidget {
  ProductItem({
    Key? key,
    required this.w,
    required this.h,
    required this.tabController,
    required this.productModel,
  }) : super(key: key);
  final TabController tabController;
  final double w;
  final double h;
  final ProductModel productModel;
  MyService myService = MyService();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: w * 0.7,
      height: h * 0.13,
      child: GestureDetector(
        onTap: () {
          myService.setSelectedProduct = productModel;
          tabController.animateTo(5);
        },
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    productModel.name,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: imgUrlOLa + productModel.image,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
