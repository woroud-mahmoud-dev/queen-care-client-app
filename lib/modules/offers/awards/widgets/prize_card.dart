import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/prize_model.dart';

// class PrizeCard extends StatelessWidget {
//   const PrizeCard({super.key,
//     required this.title, required this.width, required this.height,
//   });
//   final String title;
//   final double width;
//   final double height;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(10.0),
//       width:  width,
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         gradient: const LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           // Add one stop for each color. Stops should increase from 0 to 1
//           stops: [
//             0.3,
//             0.8,
//           ],
//           colors: [
//             Color(0xff8B1564),
//             Color(0xffBB4594),
//           ],
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(color: Colors.white, fontSize: 15),
//           ),
//         ],
//       ),
//     );
//   }
// }
class PrizeCard extends StatelessWidget {
  const PrizeCard({
    super.key,
    required this.competitionPrize,
    required this.width,
    required this.height,
  });
  final CompetitionPrize competitionPrize;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: width,
      height: height * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            right: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(competitionPrize.prize),
             const   SizedBox(height: 10,),
                Text('${competitionPrize.createdAt.year}/${competitionPrize.createdAt.month}/${competitionPrize.createdAt.day}',style:
                  const TextStyle(color: darkGrey,fontSize: 12),),
              ],
            ),
          ),
          Positioned(
            bottom:- 20,
            left: 10,
            child: SizedBox(
              height: height * 0.15,
              width: width * 0.35,
              child:Image.asset('assets/images/award.png',fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}
class PointsPrizeCard extends StatelessWidget {
  const PointsPrizeCard({
    super.key,
    required this.pointsPrize,
    required this.width,
    required this.height,
  });
  final PointsPrize pointsPrize;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: width,
      height: height * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 5),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 20,
            right: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(pointsPrize.prize),
             const   SizedBox(height: 10,),
                Text('${pointsPrize.createdAt.year}/${pointsPrize.createdAt.month}/${pointsPrize.createdAt.day}',style:
                  const TextStyle(color: darkGrey,fontSize: 12),),
              ],
            ),
          ),
          Positioned(
            bottom:- 20,
            left: 10,
            child: SizedBox(
              height: height * 0.15,
              width: width * 0.35,
              child:Image.asset('assets/images/award.png',fit: BoxFit.fill,),
            ),
          ),
        ],
      ),
    );
  }
}
