import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/home/home.dart';
import 'package:queen_care/modules/home/main_screen.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';
class Offer extends StatelessWidget {
final TabController tabController;
   Offer({Key? key, required this.tabController}) : super(key: key);
  List<MyModel> myList = [
    MyModel(title: 'مسابقات عامة', id: 1, IconName: Icons.card_giftcard, tapId: 15),
    MyModel(
        title: 'نقاطي', id: 2, IconName: Icons.receipt_long_sharp, tapId: 10),
    MyModel(title: 'QR مسح', id: 3, IconName: Icons.qr_code, tapId: 0),
    MyModel(
        title: 'الجوائز',
        id: 4,
        IconName: Icons.wine_bar,
        tapId: 13),
  ];
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: searchBar(w: w),
          ),
            SizedBox(height: h*0.05,),
          const  Align(
            alignment: Alignment.topCenter,
            child: Text('المسابقات والعروض',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: h*0.05,),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: GridView.count(
              padding: const EdgeInsets.all(10.0),
              physics: BouncingScrollPhysics(),
              childAspectRatio: (1 / 0.6),
              crossAxisSpacing: 10,
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: List.generate(myList.length, (index) {
                return GestureDetector(
                  onTap: () {

                      myList[index].id !=3?
                      tabController.animateTo(myList[index].tapId)
                          :                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> QRViewScreen()), );
               },
                  child: mainCategoryWidget(
                    text: myList[index].title,
                    myWidget: SizedBox(),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
class MyModel {
  final String title;
  final IconData IconName;
  final int id;
  final int tapId;
  MyModel(
      {required this.title,
        required this.id,
        required this.IconName,
        required this.tapId});
}

