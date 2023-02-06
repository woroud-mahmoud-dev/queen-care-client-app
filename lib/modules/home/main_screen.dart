import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/modules/consultation/client/show_my_consultations.dart';
import 'package:queen_care/modules/consultation/doctor/show_all_consultation.dart';
import 'package:queen_care/modules/home/home.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 300,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.count(
                padding: const EdgeInsets.all(10.0),
                physics: const BouncingScrollPhysics(),
                childAspectRatio: (1 / 0.6),
                crossAxisSpacing: 10,
                mainAxisSpacing: 30,
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
                                              ShowAllConsultations()),
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
    );
  }
}

class MainCategoryWidget extends StatelessWidget {
  final String text;
  final Widget myWidget;
  const MainCategoryWidget({
    Key? key,
    required this.text,
    required this.myWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.26,
      height: MediaQuery.of(context).size.height * 0.11,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            right: 0,
            left: 5,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(5 / 360),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                color: Colors.black12,
              ),
            ),
          ),
          Positioned(
            top: 2,
            right: 0,
            left: 5,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-9 / 360),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myWidget,
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
