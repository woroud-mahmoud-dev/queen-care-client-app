import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';

import 'package:queen_care/models/competion.dart';


class CompetitionWidget extends StatelessWidget {

  final Comptition competition;
  final  TabController tabController;
  CompetitionWidget({Key? key, required this.tabController, required this.competition, }) : super(key: key);
  MyService myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        myService.setSelectedComp =competition;
        tabController.animateTo(9);

      },
      child: SizedBox(
        height: h*0.17,
           width: w,
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 5),

          child: Stack(
            clipBehavior: Clip.none,

            children: [
              Positioned(
                top: 0,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,   boxShadow:  [
                    BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
                  ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(7),
                      bottomLeft: Radius.circular(7),

                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 10),

                  height: h*0.06,
                  width: w*0.29,

                  child: Center(
                    child: Text(competition.name

                      ,textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),  ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: SizedBox(


                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(' مستمرة حتى  ${competition.endDate.day }/ ${competition.endDate.year }/${competition.endDate.month }'

                      ,textAlign: TextAlign.center,style: const TextStyle(color:darkGrey,fontSize: 12),  ),
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                right: 20,
                child: SizedBox(


                  child: Text(' ${competition.description }  '

                    ,textAlign: TextAlign.center,style: const TextStyle(color:Colors.black,fontSize: 10),  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
