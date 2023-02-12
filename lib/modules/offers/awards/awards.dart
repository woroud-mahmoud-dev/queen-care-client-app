import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/modules/offers/awards/cubit/awards_cubit.dart';
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
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: darkGrey2,
                    ),
                    onTap: () {
                      tabController.animateTo(1);
                    },
                  ),
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
                      style: const TextStyle(
                          color: darkGrey2,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                state is GetMyPrizesLoadingState
                    ? const Expanded(
                    flex: 7,child: LoadingWidget())
                    : state is DeviceNotConnectedState
                        ? Expanded(
                  flex: 7,
                            child: NoInternetWidget(
                              onPressed: () {
                                AwardsCubit.get(context).getMyPrizes();
                              },
                            ),
                          )
                        : state is GetMyPrizesErrorState
                            ? Expanded(
                  flex: 7,
                                child: CustomErrorWidget(
                                  onPressed: () {
                                    AwardsCubit.get(context).getMyPrizes();
                                  },
                                ),
                              )
                            : (myPrizesList.isEmpty)
                                ? const Center(
                                    child: Text(
                                      'لا توجد جوائز ',
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                : Expanded(
                  flex: 7,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        clipBehavior: Clip.hardEdge,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return PrizeCard(
                                            height: h * 0.07,
                                            width: w * 0.65,
                                            title: myPrizesList[index].prize,
                                          );
                                        },
                                        itemCount: myPrizesList.length),
                                  ),
                 Expanded(
                   flex: 1,
                     child: LogoImage(
                   h: h*0.1,
                  w:w,


                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
