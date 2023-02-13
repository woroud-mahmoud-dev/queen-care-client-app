import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/modules/offers/points/cubit/points_cubit.dart';

class MyPointsBalance extends StatelessWidget {
  final TabController tabController;
  const MyPointsBalance({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => PointsCubit()..getMyPoints(),
      child: BlocBuilder<PointsCubit, PointsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [

                    InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color: darkGrey2,
                      ),
                      onTap: () {
                        tabController.animateTo(10);
                      },
                    ),
                    const Spacer(),
                  ],
                ),

                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'my_points_balance'.tr(context),
                      style: const TextStyle(
                        color: kBlueGreen,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.14,
                ),
                state is GetMyPointsLoading
                    ? const Center(child: LoadingWidget())
                    : state is GetMyPointsError
                        ? Expanded(
                            child: CustomErrorWidget(
                              onPressed: () {
                                PointsCubit.get(context).getMyPoints();
                              },
                            ),
                          )
                        : state is DeviceNotConnectedState
                            ? Expanded(
                              child: NoInternetWidgetWithoutImage(
                                  onPressed: () {
                                    PointsCubit.get(context).getMyPoints();
                                  },
                                ),
                            )
                            : Row(
                                children: [
                                  Text(
                                    '${"my_current_balance".tr(context)} : ${PointsCubit.get(context).myPoints == '' ? '0' : double.parse(PointsCubit.get(context).myPoints).round()}  ${"point".tr(context)}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                SizedBox(
                  height: h * 0.14,
                ),
                CustomButton(
                  height: h * 0.08,
                  width: w * 0.7,
                  onTap: () {
                    tabController.animateTo(12);
                  },
                  title: 'replace'.tr(context),
                ),

                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
