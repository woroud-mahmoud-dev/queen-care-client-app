
import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      elevation: 3,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}