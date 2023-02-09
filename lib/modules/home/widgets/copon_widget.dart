import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class coponWidget extends StatelessWidget {
  coponWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.onTap,
  }) : super(key: key);

  final double h;
  final double w;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: h*0.11,
        width: w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kBlueGreen,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
          ],

        ),
        child: Row(
          children: [
            Expanded(

                flex: 1,
                child: Container(
                  height: h*0.09,
                  width: h*0.09,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,

                    borderRadius: BorderRadius.circular(5),


                  ),
                  child: Center(child:  Image.asset('assets/images/copon.png')),
                )),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                 const   [
                      Text('احصل على كوبون خصم  ',
                        style: TextStyle(
                            color: kBlueGreen,                         fontSize: 14


                        ),),
                      Text('60%  ',
                        style: TextStyle(
                            color: kBlueGreen,                        fontSize: 14


                        ),),

                    ],),
                )),
         const   Spacer(),
          ],
        ),

      ),
    );
  }
}
