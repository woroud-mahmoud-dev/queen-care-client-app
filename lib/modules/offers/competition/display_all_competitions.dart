import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/competition.dart';
import 'package:queen_care/modules/offers/competition/cubit/competition_cubit.dart';
import 'package:queen_care/modules/home/widgets/custom_search_bar.dart';
import 'package:queen_care/modules/offers/competition/widgets/competitions_part.dart';

class DisplayAllCompetitions extends StatelessWidget {
  final TabController tabController;
  const DisplayAllCompetitions({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CompetitionCubit()..getAllCompetitions(),
      child: BlocConsumer<CompetitionCubit, CompetitionState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          List<Competition> allCompetitions =
              CompetitionCubit.get(context).allCompetitionsList;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomSearchBar(w: w),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'general_co'.tr(context),
                      style: TextStyle(
                        color: kBlueGreen,
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: h * 0.05,
                    ),
                  ],
                ),
                LogoImage(w: w, h: h * 0.2),
                state is GetAllCompetitionsLoadingState
                    ? const Expanded(child: LoadingWidget())
                    : state is DeviceNotConnectedState
                        ? Expanded(
                            child: NoInternetWidget(
                              onPressed: () {
                                CompetitionCubit.get(context)
                                    .getAllCompetitions();
                              },
                            ),
                          )
                        : state is GetAllCompetitionsErrorState
                            ? Expanded(
                                child: CustomErrorWidget(
                                  onPressed: () {
                                    CompetitionCubit.get(context)
                                        .getAllCompetitions();
                                  },
                                ),
                              )
                            : Expanded(
                                child: CompetitionsPart(
                                  tabController: tabController,
                                  allCompetitions: allCompetitions,
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
