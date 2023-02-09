import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/text_filed.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';
import 'package:queen_care/modules/consultation/doctor/show_all_consultation.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class AddAnswer extends StatelessWidget {
  AddAnswer({
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
        listener: (context, state) {
          if (state is AddAnswerSuccess) {
            showToast(text: 'تم إرسال إجابتك بنجاح ', color: Colors.green);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const ShowAllConsultations()),
            );
          }
          if (state is AddQuestionError) {
            showToast(
                text: 'حدث خطأ أثناء إرسال الإجابة \n يرجى المحاولة لاحقاً',
                color: Colors.red);
          }
        },
        builder: (context, state) {

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
                    state is AddQuestionLoading
                        ? Center(
                            child: Column(
                              children: const [
                                Text(
                                  'يتم إرسال إجابتك',
                                  style: TextStyle(fontSize: 16),
                                ),
                                CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
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
                                    Align(
                                      alignment: Alignment.center,
                                      child: ConsultationTextField(
                                        maxLines: 4,
                                        h: h * 0.2,
                                        w: w * 0.8,
                                        hintText: 'أدخل الجواب هنا ',
                                        controller: answerController,
                                        context: context,
                                      ),
                                    ),
                                    SizedBox(
                                      height: h * 0.03,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (answerController.text
                                              .trim()
                                              .isEmpty) {
                                            showToast(
                                                text:
                                                    "يرجى كتابة الاجابة أولاً",
                                                color: Colors.amber);
                                          } else {
                                            ConsultationCubit.get(context)
                                                .sendAnswer(
                                                    questionId:
                                                        consultation.id,
                                                    answer:
                                                        answerController.text);
                                          }
                                        },
                                        child: SizedBox(
                                          width: w * 0.6,
                                          height: h * 0.09,
                                          child: Card(
                                            color: kPrimaryColor,
                                            elevation: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    Text(
                                                      'إرسال',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
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
