
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/models/consultation.dart';

import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';
import 'package:queen_care/modules/consultation/doctor/add_answer.dart';
import 'package:queen_care/modules/home/main_screen.dart';

import '../Widgets/answer_widget.dart';

class ShowAllConsultations extends StatelessWidget {
 const ShowAllConsultations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ConsultationCubit()..getAllQuestions(),
      child: BlocConsumer<ConsultationCubit, ConsultationState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<Consultation> allConsultationsList =
              ConsultationCubit.get(context).allConsultationList;

          return Scaffold(
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => MainScreen()),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: black,
                              )),
                          const Spacer(),
                          const GoCart(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(
                              'assets/icons/list.svg',
                              height: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'استشارة',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: h * 0.83,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(50, 30),
                        ),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: state is GetAllQuestionsLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'الاستشارات',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  AllConsultation(allConsultationsList: allConsultationsList, h: h, w: w),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AllConsultation extends StatelessWidget {
  const AllConsultation({
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
    return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            physics:
                const BouncingScrollPhysics(),
            itemCount:
                allConsultationsList.length,
            itemBuilder: (BuildContext context,
                int index) {
              return Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Text(
                    '- ${allConsultationsList[index].question}',
                    maxLines: 3,
                    style: const TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17),
                  ),
                  allConsultationsList[index]
                          .answer!
                          .isEmpty
                      ? const Text(
                          'لم تتم الإجابة بعد..',
                          style: TextStyle(
                              fontSize: 12,
                              color: darkGrey),
                          maxLines: 3)
                      : AnswersWidget(
                          allConsultationsList:
                              allConsultationsList,
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
                        width: 30,
                        decoration:
                            const BoxDecoration(
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
                                          allConsultationsList[
                                              index])));
                        },
                        child: Container(
                          padding:
                              const EdgeInsets
                                  .all(3),
                          alignment: Alignment
                              .centerRight,
                          height: h * 0.05,
                          width: w * 0.7,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      kPrimaryColor),
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          6)),
                          child: const Text(
                            'أدخل الجواب هنا ',
                            maxLines: 3,
                            style: TextStyle(
                                color: darkGrey,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}
