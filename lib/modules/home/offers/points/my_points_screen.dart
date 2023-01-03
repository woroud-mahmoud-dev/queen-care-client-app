import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

class MyPoints extends StatelessWidget {
  final TabController tabController;
  const MyPoints({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [


          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: const Icon(Icons.arrow_forward_ios_sharp,color: darkGrey2,),
              onTap: (){
                tabController.animateTo(1);
              },
            ),
          ),
          SizedBox(height: h*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[


               Text('نقاطي',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),

            ],
          ),

          SizedBox(height: h*0.05,),
          GeneralButton(onTap: (){
            tabController.animateTo(11);
          }, title: 'رصيدي من النقاط',textColor: darkGrey2,elevation: 5,margin: const EdgeInsets.symmetric(horizontal: 20),    padding: 15,),
          SizedBox(height: h*0.03,),

          GeneralButton(onTap: (){
            tabController.animateTo(12);


          }, title: 'استبدال نقاطي',
    padding: 15,
            textColor: darkGrey2,elevation: 5,margin: const EdgeInsets.symmetric(horizontal: 20),),
          SizedBox(height: h*0.03,),

          GeneralButton(onTap: (){
            tabController.animateTo(14);

          }, title: 'آلية الحصول على النقاط', textColor: darkGrey2,elevation: 5,margin: const EdgeInsets.symmetric(horizontal: 20),    padding: 15,),
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 200,
              width: 200,
            ),
          ),


        ],
      ),
    );
  }
}


