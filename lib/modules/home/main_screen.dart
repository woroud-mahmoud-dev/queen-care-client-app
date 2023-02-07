import 'package:flutter/material.dart';
import 'package:queen_care/core/widget/main_category_item.dart';

import 'package:queen_care/modules/consultation/client/show_my_consultations.dart';
import 'package:queen_care/modules/consultation/doctor/show_all_consultation.dart';
import 'package:queen_care/modules/home/home.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';
import 'package:queen_care/network/local/cache_helper.dart';

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background.png',
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              SizedBox(height: h*0.05,),

              SearchBar(w: w * 0.8),
              SizedBox(height: h*0.05,),

              SizedBox(
                child: GridView.count(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0.0),
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: (1 / 0.65),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 40,
                  crossAxisCount: 2,
                  children: List.generate(myList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        myList[index].id != 3 && myList[index].id != 6
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) =>
                                        Home(tapId: myList[index].tapId)),
                              )
                            : myList[index].id == 3
                                ? Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (_) => const QRViewScreen()),
                                  )
                                : CacheHelper.getData(key: 'type') == "1"
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const ShowAllConsultations()),
                                      )
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ShowMyConsultations()),
                                      );
                      },
                      child: MainCategoryWidget(
                        text: myList[index].title,
                        myWidget: Icon(
                          myList[index].iconName,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

