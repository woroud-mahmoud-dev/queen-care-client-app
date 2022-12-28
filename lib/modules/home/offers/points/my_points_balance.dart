import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

import 'package:queen_care/modules/home/widgets/search_bar.dart';
class MyPointsBalance extends StatelessWidget {
  final TabController tabController;
  const MyPointsBalance({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: const Icon(Icons.arrow_forward_ios_sharp,color: darkGrey2,),
              onTap: (){
                tabController.animateTo(10);
              },
            ),
          ),
          SizedBox(height: h*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [


              Text('رصيدي من النقاط',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),

            ],
          ),



          SizedBox(height: h*0.14,),

const Align(
  alignment: Alignment.topRight,
  child:               Text('رصيدي الحالي : 222 نقطة ',
    style: TextStyle(
        color: darkGrey2,
        fontSize: 16,
        fontWeight: FontWeight.bold
    ),),
),
          SizedBox(height: h*0.14,),
          GeneralButton(onTap: (){
            tabController.animateTo(12);

          }, title: 'استبدال',margin: const EdgeInsets.symmetric(horizontal: 15),elevation: 7,
          padding: 15,),


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


