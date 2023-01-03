import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/prize_model.dart';
import 'package:queen_care/modules/home/offers/cubit/offers_cubit.dart';

import 'package:queen_care/modules/home/widgets/search_bar.dart';

class Awards extends StatelessWidget {
  final TabController tabController;
  const Awards({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => OffersCubit()..getMyPrizes(),
      child: BlocConsumer<OffersCubit, OffersState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<PrizeModel> myPrizesList = OffersCubit.get(context).myPrizes;
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
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
                  children: const [
                    Text(
                      'الجوائز',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.07,
                ),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'الجوائز التي حصلت عليها',
                    style: TextStyle(
                        color: darkGrey2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: h * 0.06,
                ),
                state is GetMyPrizesLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      )
                    : (myPrizesList.isEmpty)
                        ? const Center(
                            child: Text(
                              'لا توجد جوائز ',
                              style: TextStyle(
                                  color:   kPrimaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : SizedBox(
                            child: ListView.builder(
                                clipBehavior: Clip.hardEdge,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return prizeCard(
                                    title: myPrizesList[index].prize,
                                  );
                                },
                                itemCount: myPrizesList.length),
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

class prizeCard extends StatelessWidget {
  const prizeCard({
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
