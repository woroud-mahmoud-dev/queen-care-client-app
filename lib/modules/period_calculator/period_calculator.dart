import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
class PeriodCalculator extends StatelessWidget {
  const PeriodCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Container(

      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor2,
      child: ListView(
        physics: BouncingScrollPhysics(),

        children: [
          SizedBox(
            height: h*0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: black,
                    )),
                const Spacer(),
                const Icon(
                  Icons.shopping_bag_sharp,
                  color: black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset(
                    'assets/icons/list.svg',
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h*0.02,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "تتبع الدورة الشهرية",
                style: TextStyle(fontSize: 16),

              ),
            ),
          ),      SizedBox(
            height: h*0.02,
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: h*0.75,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(50, 30),
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
