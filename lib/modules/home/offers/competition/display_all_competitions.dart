import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/competion.dart';
import 'package:queen_care/modules/home/offers/cubit/offers_cubit.dart';
import 'package:queen_care/modules/home/offers/widgets/competitios_part.dart';

import 'package:queen_care/modules/home/widgets/search_bar.dart';

class DisplayAllCompetitions extends StatelessWidget {
  final TabController tabController;
  const DisplayAllCompetitions({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;


    return BlocProvider(
  create: (context) => OffersCubit()..getAllCompetitions(),
  child: BlocConsumer<OffersCubit, OffersState>(
  listener: (context, state) {
    // TODO: implement listener
  },

  builder: (context, state) {
    List<Comptition> allCompetitions=OffersCubit.get(context).allCompetitionsList;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: searchBar(w: w),
          ),
          SizedBox(
            height: h * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: h * 0.05,
              ),
              const Text(
                'المسابقات والعروض',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: darkGrey2,
                ),
                onTap: () {
                  tabController.animateTo(1);
                },
              )
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),



          state is GetAllCompetitionsLoadingState?const Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          ) : CompetitionsPart(
            tabController: tabController,
            allCompetitions: allCompetitions,
          ),
        ],
      ),
    );
  },
),
);
  }
}
