
import 'package:flutter/material.dart';

import 'package:queen_care/models/competition.dart';
import 'package:queen_care/modules/offers/competition/widgets/competition_widget.dart';

class CompetitionsPart extends StatelessWidget {
  const CompetitionsPart({
    Key? key,
    required this.allCompetitions, required this.tabController,
  }) : super(key: key);

  final   List<Competition> allCompetitions;
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.663,
        child: ListView.builder(clipBehavior: Clip.hardEdge,

            physics:const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(2),


            shrinkWrap: true,
            itemBuilder: (BuildContext context, int int) {


              return CompetitionWidget(

                tabController:tabController ,
                competition:allCompetitions[int] ,


              );
            },

            itemCount: allCompetitions.length),
      ),
    );
  }
}

