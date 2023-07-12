import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/order_client.dart';
import 'package:queen_care/models/product.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({
    super.key,
    required this.orderClients,
    required this.products,
  });
  final List<OrderClient> orderClients;
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      child: ListView.builder(
        physics:const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: orderClients.length,
        itemBuilder: (BuildContext context, int y) {
          ProductModel productModel = products.firstWhere(
                  (element) => element.id.toString() == orderClients[y].missionId);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: imgUrl + productModel.image,
                    placeholder: (context, url) => const Center(
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: kPrimaryColor,
                            strokeWidth: 0.2,
                          ),
                        )),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  CacheHelper.getData(key: 'LOCALE') == "en"
                      ? productModel.enName
                      : productModel.name,
                  textAlign: TextAlign.center,
                  maxLines: 4,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '${"number".tr(context)} :${orderClients[y].amount} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "${"price".tr(context)} :${orderClients[y].price}",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 10.sp, color: Colors.black),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}