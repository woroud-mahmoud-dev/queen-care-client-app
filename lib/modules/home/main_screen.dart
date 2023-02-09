import 'package:flutter/material.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/home/widgets/main_categories_part.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';

import 'package:queen_care/modules/home/widgets/search_bar.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);


  final List<MainScreenItemModel> myList = [
    MainScreenItemModel(
        title: 'المنتجات', id: 1, iconName: Icons.card_giftcard, tapId: 0),
    MainScreenItemModel(
        title: 'الحاسبة',
        id: 2,
        iconName: Icons.calendar_month_sharp,
        tapId: 7),
    MainScreenItemModel(title: 'QR', id: 3, iconName: Icons.qr_code, tapId: 3),
    MainScreenItemModel(
        title: 'العروض والمسابقات',
        id: 4,
        iconName: Icons.local_offer_outlined,
        tapId: 1),
    MainScreenItemModel(
        title: 'نصائح',
        id: 5,
        iconName: Icons.corporate_fare_rounded,
        tapId: 16),
    MainScreenItemModel(
        title: 'استشارة',
        id: 6,
        iconName: Icons.question_answer_outlined,
        tapId: 16),
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: w,
          height: h,
          decoration: customBoxDecoration,
          child: Column(
            children: [
              SizedBox(
                height: h * 0.07,
              ),
              SearchBar(w: w * 0.8),
              SizedBox(
                height: h * 0.07,
              ),
              MainCategoriesPart(myList: myList),
            ],
          ),
        ),
      ),
    );
  }
}

