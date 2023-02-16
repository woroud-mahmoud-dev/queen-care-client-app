import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';
import 'package:queen_care/core/widget/main_category_item.dart';

class Offer extends StatelessWidget {
  final TabController tabController;
  const Offer({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    final List<MainScreenItemModel> myList = [
      MainScreenItemModel(
        title: 'general_co'.tr(context),
        id: 1,
        iconName: Icons.card_giftcard,
        tapId: 15,
      ),
      MainScreenItemModel(
          title: 'my_points'.tr(context),
          id: 2,
          iconName: Icons.receipt_long_sharp,
          tapId: 10),
      MainScreenItemModel(
          title: 'scan_qr'.tr(context),
          id: 3,
          iconName: Icons.qr_code,
          tapId: 0),
      MainScreenItemModel(
          title: 'awards'.tr(context),
          id: 4,
          iconName: Icons.wine_bar,
          tapId: 13),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(w: w),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'offers_and_competition'.tr(context),
              style: TextStyle(
                color: kBlueGreen,
                fontSize: 20.sp,
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
