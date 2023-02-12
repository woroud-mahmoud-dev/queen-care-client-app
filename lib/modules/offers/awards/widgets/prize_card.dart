
import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({super.key,
    required this.title, required this.width, required this.height,
  });
  final String title;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width:  width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [
            0.3,
            0.8,
          ],
          colors: [
            Color(0xff8B1564),
            Color(0xffBB4594),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}