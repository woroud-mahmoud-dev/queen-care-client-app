import 'package:flutter/material.dart';

import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/loading_widget.dart';

import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/add_new_consultation_button.dart';
import 'package:queen_care/modules/consultation/client/consultation_details.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';

class AllMyConsultationsWidget extends StatelessWidget {
  const AllMyConsultationsWidget(
      {Key? key,
      required this.h,
      required this.w,
      required this.myConsultationsList,
      required this.state})
      : super(key: key);
  final double h;
  final double w;
  final ConsultationState state;
  final List<Consultation> myConsultationsList;
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
            Row(
              children: [
                Text(
                  'my_consulting'.tr(context),
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
              ],
            ),
            state is GetMyQuestionsLoading
                ? const Expanded(child: LoadingWidget())
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: myConsultationsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '- ${myConsultationsList[index].question}',
                                    maxLines: 3,
                                    style: const TextStyle(
                                        color: kPrimaryColor, fontSize: 14),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ConsultationDetails(
                                                consultation:
                                                    myConsultationsList[
                                                        index])));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "تفاصيل الاستشارة",
                                      style: TextStyle(
                                          fontSize: 11, color: darkGrey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
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
