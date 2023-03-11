import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/competition.dart';

class CompetitionWidget extends StatelessWidget {
  final Competition competition;
  final TabController tabController;
  CompetitionWidget({
    Key? key,
    required this.tabController,
    required this.competition,
  }) : super(key: key);
  final myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        myService.setSelectedComp = competition;
        tabController.animateTo(9);
      },
      child: SizedBox(
        height: h * 0.17,
        width: w,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 0,
                right: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 5),
                    ],
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(7),
                      bottomLeft: Radius.circular(7),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: h * 0.07,
                  width: w * 0.35,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        competition.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 5,
                child: SizedBox(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      ' مستمرة حتى  ${competition.endDate.day}/ ${competition.endDate.year}/${competition.endDate.month}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
