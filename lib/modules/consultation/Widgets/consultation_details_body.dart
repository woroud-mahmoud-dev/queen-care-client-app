import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/add_new_consultation_button.dart';

class ConsultationDetailsBody extends StatelessWidget {
  const ConsultationDetailsBody(
      {Key? key, required this.h, required this.w, required this.consultation})
      : super(key: key);
  final double h;
  final double w;
  final Consultation consultation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: h * 0.795,
        decoration: customContainerBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'counseling'.tr(context),
              style: const TextStyle(fontSize: 17),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        consultation.question,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Divider(
              color: darkGrey2,
              thickness: 2,
              endIndent: w * 0.02,
              indent: w * 0.02,
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Text(
              'consulting_answer'.tr(context),
              style: const TextStyle(fontSize: 17),
            ),
            consultation.answer!.isEmpty
                ? Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            "doctor_answer".tr(context),
                            style:
                                const TextStyle(fontSize: 11, color: darkGrey),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index1) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  ' _ ',
                                  style: TextStyle(
                                      fontSize: 12, color: kPrimaryColor),
                                ),
                                Expanded(
                                  child: Text(
                                      consultation.answer![index1].answer
                                          .toString(),
                                      style: const TextStyle(fontSize: 12),
                                      maxLines: 5),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: consultation.answer!.length,
                    ),
                  ),
            SizedBox(
              height: h * 0.03,
            ),
            AddNewConsultation(w: w, h: h),
            SizedBox(
              height: h * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
