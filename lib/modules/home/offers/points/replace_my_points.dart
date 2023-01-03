import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';

class ReplaceMyPoints extends StatelessWidget {
  final TabController tabController;
  const ReplaceMyPoints({Key? key, required this.tabController}) : super(key: key);

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
                tabController.animateTo(10);
              },
            ),
          ),
          SizedBox(height: h*0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [


              Text('استبدال نقاطي',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),

            ],
          ),

          SizedBox(height: h*0.1,),

          const Align(
            alignment: Alignment.topRight,
            child:               Text('يمكنك استبدال النقاط بإحدى الجوائز التالية',
              style: TextStyle(
                  color: darkGrey2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: h*0.03,),
          const Align(
            alignment: Alignment.topRight,
            child:               Text('هدية رقم 1',
              style: TextStyle(
                  color: darkGrey2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: h*0.03,),

          const Align(
            alignment: Alignment.topRight,
            child:               Text('هدية رقم2 ',
              style: TextStyle(
                  color: darkGrey2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
          ),
          SizedBox(height: h*0.03,),

          const Align(
            alignment: Alignment.topRight,
            child:               Text('هدية رقم3 ',
              style: TextStyle(
                  color: darkGrey2,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),),
          ),

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


