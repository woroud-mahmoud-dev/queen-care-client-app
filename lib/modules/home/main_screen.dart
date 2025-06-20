import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/home/widgets/main_categories_part.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';

import 'package:queen_care/modules/home/widgets/custom_search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MainScreenItemModel> myList = [
      MainScreenItemModel(
          title: 'products'.tr(context),
          id: 1,
          iconName: Icons.card_giftcard,
          tapId: 0),
      MainScreenItemModel(
          title: 'calculator'.tr(context),
          id: 2,
          iconName: Icons.calendar_month_sharp,
          tapId: 7),
      MainScreenItemModel(
          title: 'my_orders'.tr(context),
          id: 5,
          iconName: Icons.border_all_rounded,
          tapId: 18),
      MainScreenItemModel(
          title: 'QR', id: 3, iconName: Icons.qr_code, tapId: 3),
      MainScreenItemModel(
          title: 'offers_and_competition'.tr(context),
          id: 4,
          iconName: Icons.local_offer_outlined,
          tapId: 1),
      MainScreenItemModel(
          title: 'advices'.tr(context),
          id: 5,
          iconName: Icons.corporate_fare_rounded,
          tapId: 16),
      MainScreenItemModel(
          title: 'consultation'.tr(context),
          id: 6,
          iconName: Icons.question_answer_outlined,
          tapId: 16),

    ];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(5),
        width: w,
        height: h,
        decoration: customBoxDecoration,
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: h * 0.03,
            ),
            CustomSearchBar(w: w * 0.8),
            SizedBox(
              height: h * 0.04,
            ),
            MainCategoriesPart(myList: myList),
            SizedBox(
              height: h * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
