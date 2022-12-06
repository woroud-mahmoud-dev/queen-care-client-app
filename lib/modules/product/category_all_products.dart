import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/product/prouct_screen.dart';

class CategoryAllProducts extends StatelessWidget {
  const CategoryAllProducts({Key? key, required this.tabController})
      : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
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
                    IconButton(
                        onPressed: () {
                        tabController.animateTo(0);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: black,
                        )),
                    const Spacer(),
                    const Icon(
                      Icons.shopping_bag_sharp,
                      color: black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset(
                        'assets/icons/list.svg',
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),     Expanded(
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
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text('4.5'),
                    Spacer(),
                    Text(
                      'فوط صحية شهرية',
                      style: TextStyle(fontSize: 20),
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
                child: Column(
                  children: [
                    ProductItem(
                      w: w,
                      h: h,
                      tabController: tabController,
                    ),
                    ProductItem(
                      w: w,
                      h: h,
                      tabController: tabController,
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.w,
    required this.h,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: w * 0.8,
      height: h * 0.14,
      child: GestureDetector(
        onTap: () {
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
                  flex: 1,
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl:
                        'https://karam-app.com/celo/queencare/public/storage/company_types/uploads/image638731908ef13_175203.png',
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
                Expanded(
                  flex: 2,
                  child: Text(
                    'فوط كوين النهارية بالأجنحة ',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
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
