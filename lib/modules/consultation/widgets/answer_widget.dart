import 'package:flutter/material.dart';
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
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index2) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                // ignore: prefer_interpolation_to_compose_strings
                '_'" " + allConsultationsList[index].answer![index2].answer!,
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
