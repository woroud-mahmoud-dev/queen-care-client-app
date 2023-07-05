import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/network/local/cache_helper.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
  MyService myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: w / 2,
            ),
            IconButton(
                onPressed: () {
                  tabController.animateTo(5);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: black,
                )),
          ],
        ),
        Container(
          height: h * 0.3,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      imgUrl + myService.getSelectedProduct!.image),
                  fit: BoxFit.contain)),
        ),
        Container(
          height: h * 0.6,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
            ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CacheHelper.getData(key: 'LOCALE') == "en"
                        ? myService.getSelectedProduct!.enName
                        : myService.getSelectedProduct!.name,
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Text(
                CacheHelper.getData(key: 'LOCALE') == "en"
                    ? myService.getSelectedProduct!.enDescription
                    : myService.getSelectedProduct!.description,
                style: TextStyle(height: 1.2, fontSize: 14.sp, color: darkGrey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
