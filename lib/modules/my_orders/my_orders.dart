import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';

import 'package:queen_care/modules/my_orders/cubit/my_order_cubit.dart';
import 'package:queen_care/modules/my_orders/order_products.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => MyOrderCubit()..getMyOrders(),
      child: BlocConsumer<MyOrderCubit, MyOrderState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          MyOrderCubit cubit = MyOrderCubit.get(context);
          return SizedBox(
            height: h,
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: h * 0.08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w * 0.25,
                      ),
                      Text(
                        'my_orders'.tr(context),
                        style: TextStyle(color: kBlueGreen, fontSize: 17.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: black,
                          )),
                    ],
                  ),
                ),
                if (state is MyOrderLoading)
                  const Expanded(
                    child: Center(child: LoadingWidget()),
                  )
                else if (state is DeviceNotConnectedState)
                  Expanded(
                    child: Center(
                      child: NoInternetWidget(
                        onPressed: () {
                          cubit.getMyOrders();
                        },
                      ),
                    ),
                  )
                else if (state is MyOrderError)
                  Center(
                    child: CustomErrorWidget(
                      onPressed: () {
                        cubit.getMyOrders();
                      },
                    ),
                  )
                else if (state is MyOrderSuccess)
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.order!.order.length,
                      padding: const EdgeInsets.all(20),
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 7,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${"oder_state".tr(context)} : ",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                  ),
                                  Container(
                                    width: w / 3,
                                    margin: const EdgeInsets.only(top: 7),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: kBlueGreen),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      cubit.order!.order[index].state
                                          .tr(context),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 10.sp, color: kBlueGreen),
                                    ),
                                  )
                                ],
                              ),
                              const Divider(),
                              Text(
                                "${"products".tr(context)} : ",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                              if (cubit.order!.order[index].orderClientList
                                  .isNotEmpty)
                                OrderProducts(
                                  orderClients:
                                      cubit.order!.order[index].orderClientList,
                                  products: cubit.order!.mission,
                                ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${"total_amount".tr(context)} :${cubit.order!.order[index].price}   ${"pounds".tr(context)}",
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 10.sp, color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${"address".tr(context)} : ${cubit.order!.order[index].address}  ",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${"note".tr(context)} : ${cubit.order!.order[index].note} ",
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 10.sp, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                else if (state is MyOrdersEmpty)
                  Expanded(
                      child: Center(
                    child: Text('no_orders'.tr(context)),
                  )),
              ],
            ),
          );
        },
      ),
    );
  }
}
