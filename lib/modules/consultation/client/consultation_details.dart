import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';

import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/client/add_consultation.dart';
import 'package:queen_care/modules/consultation/client/show_my_consultations.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';

class ConsultationDetails extends StatelessWidget {
  ConsultationDetails({
    Key? key,
    required this.consultation,
  }) : super(key: key);

  final answerController = TextEditingController();
  final Consultation consultation;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ConsultationCubit(),
      child: BlocConsumer<ConsultationCubit, ConsultationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor2,
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
                                      builder: (_) => ShowMyConsultations()),
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
                          'تفاصيل الاستشارة',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: double.infinity,
                        height: h * 0.795,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(50, 30),
                          ),
                        ),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'الاستشارة :',
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              Expanded(
                                child: Text(
                                  consultation.question,
                                  style: const TextStyle(fontSize: 17),
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
                              const Text(
                                'الاإجابة :',
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: h * 0.05,
                              ),
                              consultation.answer!.isEmpty
                                  ? const Expanded(
                                      child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        " في انتظار إجابة الطبيب...",
                                        style: TextStyle(
                                            fontSize: 11, color: darkGrey),
                                      ),
                                    ))
                                  : Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index1) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: h * 0.03,
                                                    width: w * 0.05,
                                                    decoration:
                                                        const BoxDecoration(
                                                            border: Border(
                                                      right: BorderSide(
                                                        color: darkGrey2,
                                                      ),
                                                      bottom: BorderSide(
                                                        color: darkGrey2,
                                                      ),
                                                    )),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        consultation
                                                            .answer![index1]
                                                            .answer
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                        maxLines: 5),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: consultation.answer!.length,
                                      ),
                                    ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => AddConsultation()),
                                    );
                                  },
                                  child: SizedBox(
                                    width: w * 0.6,
                                    height: h * 0.09,
                                    child: Card(
                                      color: kPrimaryColor2,
                                      elevation: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Text(
                                                'إضافة استشارة أخرى',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                            ],
                          ),
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
