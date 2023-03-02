import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/doctor/add_answer.dart';
import '../Widgets/answer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllConsultationBody extends StatelessWidget {
  const AllConsultationBody({
    Key? key,
    required this.allConsultationsList,
    required this.h,
    required this.w,
  }) : super(key: key);

  final List<Consultation> allConsultationsList;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: allConsultationsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Text(
                      '- ${allConsultationsList[index].question}',
                      maxLines: 3,
                      style: TextStyle(color: kPrimaryColor, fontSize: 14.sp),
                    ),
                    allConsultationsList[index].answer!.isEmpty
                        ? Text('no_answer'.tr(context),
                            style: TextStyle(fontSize: 12.sp, color: darkGrey),
                            maxLines: 3)
                        : AnswersWidget(
                            allConsultationsList: allConsultationsList,
                            w: w,
                            index: index,
                            h: h,
                          ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 15,
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: darkGrey2,
                            ),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AddAnswer(
                                        consultation:
                                            allConsultationsList[index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            alignment: Alignment.centerRight,
                            height: h * 0.05,
                            width: w * 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(color: kPrimaryColor),
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              'enter_answer'.tr(context),
                              maxLines: 3,
                              style:
                                  TextStyle(color: darkGrey, fontSize: 10.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              })),
    );
  }
}
