import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/product.dart';
import 'package:queen_care/network/local/cache_helper.dart';

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
  final myService = MyService();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: w * 0.7,
      height: h * 0.13,
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  CacheHelper.getData(key: 'LOCALE') == "en"
                      ? productModel.enName
                      : productModel.name,
                  style: TextStyle(color: Colors.black54, fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: imgUrl + productModel.image,
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
    );
  }
}
