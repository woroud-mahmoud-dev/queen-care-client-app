import 'package:flutter/material.dart';

import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/client/consultation_details.dart';

class FrequentlyAskedQuestionsWidget extends StatelessWidget {
  const FrequentlyAskedQuestionsWidget({
    Key? key,
    required this.allConsultationList,
  }) : super(key: key);

  final List<Consultation> allConsultationList;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              clipBehavior: Clip.antiAlias,
              physics: const BouncingScrollPhysics(),
              itemCount: allConsultationList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ConsultationDetails(
                                consultation: allConsultationList[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('- ${allConsultationList[index].question}',
                        maxLines: 3),
                  ),
                );
              })),
    );
  }
}
