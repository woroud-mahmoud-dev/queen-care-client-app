import 'package:flutter/material.dart';
import 'package:queen_care/core/widget/main_category_item.dart';
import 'package:queen_care/modules/consultation/client/show_my_consultations.dart';
import 'package:queen_care/modules/consultation/doctor/show_all_consultation.dart';
import 'package:queen_care/modules/home/home.dart';
import 'package:queen_care/modules/home/widgets/main_screen_item_model.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class MainCategoriesPart extends StatelessWidget {
  const MainCategoriesPart({
    Key? key,
    required this.myList,
  }) : super(key: key);

  final List<MainScreenItemModel> myList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10.0),
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
                          builder: (_) => Home(tapId: myList[index].tapId)),
                    )
                  : myList[index].id == 3
                      ? Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const QRViewScreen()),
                        )
                      : CacheHelper.getData(key: 'type') == "1"
                          ? Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => const ShowAllConsultations()),
                            )
                          : Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (_) => ShowMyConsultations()),
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
    );
  }
}
