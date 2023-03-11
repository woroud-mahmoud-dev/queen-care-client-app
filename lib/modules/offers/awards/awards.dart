import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/modules/offers/awards/cubit/awards_cubit.dart';
import 'package:queen_care/modules/offers/awards/widgets/point_prize_card.dart';
import 'package:queen_care/modules/offers/awards/widgets/prize_card.dart';

class Awards extends StatelessWidget {
  final TabController tabController;
  const Awards({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AwardsCubit()..getMyPrizes(),
      child: BlocConsumer<AwardsCubit, AwardsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<CompetitionPrize> myPrizesList =
              AwardsCubit.get(context).myPrizes;
          List<PointsPrize> myPointsPrizes =
              AwardsCubit.get(context).myPointsPrizes;
          return ListView(
            clipBehavior: Clip.none,
            padding: const EdgeInsets.all(20.0),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  InkWell(
                    child: const Icon(
                      Icons.arrow_back,
                      color: darkGrey2,
                    ),
                    onTap: () {
                      tabController.animateTo(1);
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
                    'awards'.tr(context),
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.07,
              ),
              Row(
                children: [
                  Text(
                    'awards_you_have_received'.tr(context),
                    style: TextStyle(
                      color: darkGrey2,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              state is GetMyPrizesLoadingState
                  ? SizedBox(height: h * 0.5, child: const LoadingWidget())
                  : state is DeviceNotConnectedState
                      ? SizedBox(
                          height: h * 0.5,
                          child: NoInternetWidget(
                            onPressed: () {
                              AwardsCubit.get(context).getMyPrizes();
                            },
                          ),
                        )
                      : state is GetMyPrizesErrorState
                          ? SizedBox(
                              height: h * 0.5,
                              child: CustomErrorWidget(
                                onPressed: () {
                                  AwardsCubit.get(context).getMyPrizes();
                                },
                              ),
                            )
                          : (myPrizesList.isEmpty)
                              ? SizedBox(
                                  height: h * 0.5,
                                  child: Center(
                                    child: Text(
                                      'no_prizes'.tr(context),
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          clipBehavior: Clip.none,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return PrizeCard(
                                              height: h,
                                              width: w,
                                              competitionPrize:
                                                  myPrizesList[index],
                                            );
                                          },
                                          itemCount: myPrizesList.length),
                                    ),
                                    SizedBox(
                                      child: ListView.builder(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          clipBehavior: Clip.none,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return PointsPrizeCard(
                                              height: h,
                                              width: w,
                                              pointsPrize:
                                                  myPointsPrizes[index],
                                            );
                                          },
                                          itemCount: myPointsPrizes.length),
                                    ),
                                  ],
                                ),
              LogoImage(
                h: h * 0.15,
                w: w,
              )
            ],
          );
        },
      ),
    );
  }
}
