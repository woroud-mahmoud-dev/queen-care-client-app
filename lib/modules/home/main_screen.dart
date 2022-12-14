import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/home/home.dart';
import 'package:queen_care/modules/qr/qr_scanner_screen.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
List <MyModel> myList=[
  MyModel(title: 'المنتجات', id: 1, IconName: Icons.card_giftcard, tapId: 0),
  MyModel(title: 'الحاسبة', id: 2, IconName: Icons.calendar_month_sharp, tapId: 7),
  MyModel(title: 'QR', id: 3, IconName: Icons.qr_code, tapId: 0),
  MyModel(title: 'العروض والمسابقات', id: 4, IconName: Icons.local_offer_outlined, tapId: 1),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5),
              child:  Center(
                child: Image.asset('assets/images/logo.png',height: 200,width: 300,),
              ),),
            Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.6,
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home(tapId:myList[index].tapId )), )
:                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> QRViewScreen()), );

                    },
                    child:mainCategoryWidget(text:myList[index].title,
                    myWidget: Icon(myList[index].IconName,color: Colors.white,size: 30,),
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

class mainCategoryWidget extends StatelessWidget {
  final String text;
  final Widget myWidget;
   mainCategoryWidget({
    Key? key, required this.text, required this.myWidget,
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
              turns: new AlwaysStoppedAnimation(5 / 360),
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
              turns: new AlwaysStoppedAnimation(-9/ 360),
              child: Card(
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    myWidget,
                    Text(text,style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,),

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
class MyModel{
  final String title;
  final IconData IconName;
  final int id;
  final int tapId;
  MyModel({required this.title,required this.id,required this.IconName,required this.tapId});

}
