import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';

import 'package:queen_care/modules/home/widgets/search_bar.dart';
class HowToGetPoints extends StatelessWidget {
  final TabController tabController;
  const HowToGetPoints({Key? key, required this.tabController}) : super(key: key);

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
            children: const[


               Text('آلية الحصول على النقاط',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),

            ],
          ),



          SizedBox(height: h*0.07,),

          const Align(
            alignment: Alignment.topRight,
            child:               Text('يمكنك الحصول على النقاط من خلال',
              style: TextStyle(
                  color: darkGrey2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: h*0.12,),


          GeneralButton(onTap: (){
            tabController.animateTo(9);

          }, title: 'المسابقات العامة',margin: const EdgeInsets.symmetric(horizontal: 15),elevation: 7,
            padding: 15,),
          SizedBox(height: h*0.05,),

          GeneralButton(onTap: (){
            tabController.animateTo(0);

          }, title: 'شراء منتج',margin: const EdgeInsets.symmetric(horizontal: 15),elevation: 7,
            padding: 15,),


          SizedBox(height: h*0.05,),


          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
                width: 200,
              ),
            ),
          ),


        ],
      ),
    );
  }
}


