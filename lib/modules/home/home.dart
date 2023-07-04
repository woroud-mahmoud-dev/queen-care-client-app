import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/advices/advice_details_screen.dart';
import 'package:queen_care/modules/advices/show_all_advices_screen.dart';
import 'package:queen_care/modules/auth/pages/profile/profile.dart';
import 'package:queen_care/modules/favorite/favorite_tap.dart';
import 'package:queen_care/modules/home/cubit/home_tap_cubit.dart';
import 'package:queen_care/modules/home/home_tap.dart';
import 'package:queen_care/modules/offers/awards/awards.dart';
import 'package:queen_care/modules/offers/competition/display_all_competitions.dart';
import 'package:queen_care/modules/offers/competition/general_competitions.dart';
import 'package:queen_care/modules/offers/offers_tap.dart';
import 'package:queen_care/modules/offers/points/how_to_get_points.dart';
import 'package:queen_care/modules/offers/points/my_points_balance.dart';
import 'package:queen_care/modules/offers/points/my_points_screen.dart';
import 'package:queen_care/modules/offers/points/replace_my_points.dart';
import 'package:queen_care/modules/period_calculator/period_calculator.dart';
import 'package:queen_care/modules/period_calculator/period_questions.dart';
import 'package:queen_care/modules/product/category_all_products.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';
import 'package:queen_care/modules/product/product_details.dart';
import '../product/product_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.tapId}) : super(key: key);
  final int tapId;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _currentIndexBottomNavigationBarItem = 0;

  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 18,
        vsync: this,
        initialIndex: widget.tapId,
        animationDuration: const Duration(milliseconds: 500));
    tabController.addListener(handleTabSelection);
  }

  void handleTabSelection() {
    int tabIndex = tabController.index;
    switch (tabIndex) {
      // HomeTapCubit
      case 5:
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeTapCubit()..getCategoryWithHttp(),
        ),
        BlocProvider(
          create: (context) => ProductCubit()..update(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: customBoxDecoration,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: <Widget>[
              HomeTap(
                tabController: tabController,
              ), //0
              Offer(
                tabController: tabController,
              ), //1
              const Favorite(), //2

              Profile(tabController: tabController), //3
              CategoryAllProducts(tabController: tabController), //4
              ProductScreen(tabController: tabController), //5
              ProductDetails(tabController: tabController), //6
              PeriodQuestions(
                tabController: tabController,
              ), //7
              PeriodCalculator(
                tabController: tabController,
              ), //8
              GeneralCompetitions(
                tabController: tabController,
              ), //9
              MyPoints(
                tabController: tabController,
              ), //10
              MyPointsBalance(tabController: tabController), //11
              ReplaceMyPoints(tabController: tabController), //12
              Awards(tabController: tabController), //13
              HowToGetPoints(tabController: tabController), //14
              DisplayAllCompetitions(tabController: tabController), //15
              ShowAdvicesScreen(tabController: tabController), //16
              AdviceScreen(tabController: tabController), //17
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                // bottomRight: Radius.circular(20),
                // bottomLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
              child: BottomNavigationBar(
                unselectedFontSize: 11,
                selectedFontSize: 12,
                currentIndex: _currentIndexBottomNavigationBarItem,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined),
                      label: 'main'.tr(context)),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.local_offer_outlined),
                      label: 'offers'.tr(context)),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_border),
                      label: 'favorite'.tr(context)),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outline_outlined),
                      label: 'profile'.tr(context)),
                ],
                onTap: onTapedBottomsNavigationBarItem,
                backgroundColor: Colors.white,
                unselectedItemColor: darkGrey,
                selectedItemColor: kBlueGreen,
                type: BottomNavigationBarType.fixed,
              ),
            )),
      ),
    );
  }

  void onTapedBottomsNavigationBarItem(int tabIndex) {
    tabController.animateTo(tabIndex);
    setState(() {
      _currentIndexBottomNavigationBarItem = tabIndex;
    });
  }
}
