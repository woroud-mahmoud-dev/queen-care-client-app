import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class PeriodItem extends StatelessWidget {
  const PeriodItem({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
            child: Center(
              child: Icon(
                Icons.circle,
                color: color,
                size: 12,
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12, color: darkGrey),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
