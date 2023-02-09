import 'package:flutter/material.dart';
import 'package:queen_care/core/utils/constant.dart';

class MainCategoryWidget extends StatelessWidget {
  final String text;
  final Widget myWidget;
  const MainCategoryWidget({
    Key? key,
    required this.text,
    required this.myWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.26,
      height: MediaQuery.of(context).size.height * 0.11,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            right: 0,
            left: 5,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(5 / 360),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                color:darkGrey1,
              ),
            ),
          ),
          Positioned(
            top: 2,
            right: 0,
            left: 5,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-9 / 360),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myWidget,
                    Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
