import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';
import 'package:queen_care/core/widget/main_category_item.dart';

class Offer extends StatelessWidget {
  final TabController tabController;
  Offer({Key? key, required this.tabController}) : super(key: key);
  final List<MainScreenItemModel> myList = [
    MainScreenItemModel(
      title: 'مسابقات عامة',
      id: 1,
      iconName: Icons.card_giftcard,
      tapId: 15,
    ),
    MainScreenItemModel(
        title: 'نقاطي', id: 2, iconName: Icons.receipt_long_sharp, tapId: 10),
    MainScreenItemModel(
        title: 'QR مسح', id: 3, iconName: Icons.qr_code, tapId: 0),
    MainScreenItemModel(
        title: 'الجوائز', id: 4, iconName: Icons.wine_bar, tapId: 13),
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(w: w),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'المسابقات والعروض',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              physics: const BouncingScrollPhysics(),
              childAspectRatio: (1 / 0.6),
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: List.generate(
                myList.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      myList[index].id != 3
                          ? tabController.animateTo(myList[index].tapId)
                          : Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const QRViewScreen()),
                            );
                    },
                    child: MainCategoryWidget(
                      text: myList[index].title,
                      myWidget: const SizedBox(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
