import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/modules/offers/points/cubit/points_cubit.dart';
import 'package:queen_care/modules/offers/points/widget/points_prize_widget.dart';
import 'package:queen_care/modules/offers/points/widget/replace_done_widget.dart';

class ReplaceMyPoints extends StatelessWidget {
  final TabController tabController;
  const ReplaceMyPoints({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => PointsCubit()..getMyPointsPrize(),
      child: BlocConsumer<PointsCubit, PointsState>(
        listener: (context, state) {
          if (state is NotInternetToReplaceState) {
            showSnackBar(context);
          }
        },
        builder: (context, state) {
          final List<String> myPointsPrizeList =
              PointsCubit.get(context).myPointsPrizeList;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: state is ReplacePointSuccessState
                ? ReplaceDoneWidget(w: w, h: h)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            'replace_points'.tr(context),
                            style: const TextStyle(
                              color: kBlueGreen,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'replace_with_awards'.tr(context),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.03,
                      ),
                      state is GetMyPointsPrizeSuccessState
                          ? Expanded(
                              flex: 5,
                              child: ListView.builder(
                                  itemCount: myPointsPrizeList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return PointsPrizeWidget(
                                      h: h * 0.07,
                                      name: myPointsPrizeList[index],
                                      onTap: () {
                                        PointsCubit.get(context)
                                            .replacePointWithPrize(
                                                prize:
                                                    myPointsPrizeList[index]);
                                      },
                                    );
                                  }))
                          : state is DeviceNotConnectedState
                              ? Expanded(
                                  flex: 7,
                                  child: NoInternetWidget(
                                    onPressed: () {
                                      PointsCubit.get(context)
                                          .getMyPointsPrize();
                                    },
                                  ),
                                )
                              : state is GetMyPointsPrizeErrorState ||
                                      state is ReplacePointErrorState
                                  ? CustomErrorWidget(
                                      onPressed: () {
                                        PointsCubit.get(context)
                                            .getMyPointsPrize();
                                      },
                                    )
                                  : const Expanded(child: LoadingWidget()),
                      LogoImage(w: w, h: h * 0.1)
                    ],
                  ),
          );
        },
      ),
    );
  }
}
