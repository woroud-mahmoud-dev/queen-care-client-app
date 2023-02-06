
import 'package:flutter/material.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/consultation.dart';

class AnswersWidget extends StatelessWidget {
  const AnswersWidget({
    Key? key,
    required this.allConsultationsList,
    required this.w,
    required this.h,
    required this.index,
  }) : super(key: key);

  final List<Consultation> allConsultationsList;
  final double w;
  final double h;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index2) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: w * 0.05,
              decoration: const BoxDecoration(
                  border: Border(
                    // right: BorderSide(
                    //   color: darkGrey2,
                    // ),
                    bottom: BorderSide(
                      color: darkGrey2,
                    ),
                  )),
            ),
            Expanded(
              child: Text(
                allConsultationsList[index].answer![index2].answer!,
                style: const TextStyle(fontSize: 12),
                maxLines: 5,
              ),
            ),
          ],
        );
      },
      itemCount: allConsultationsList[index].answer!.length,
    );
  }
}
