import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/text_filed.dart';
import 'package:queen_care/modules/consultation/client/consultation_details.dart';
import 'package:queen_care/modules/consultation/client/show_my_consultations.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class AddConsultation extends StatelessWidget {
  AddConsultation({
    Key? key,
  }) : super(key: key);

  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => ConsultationCubit()..getAllQuestions(),
      child: BlocConsumer<ConsultationCubit, ConsultationState>(
        listener: (context, state) {
          if (state is AddQuestionSuccess) {
            showToast(text: 'تم إرسال استشارتك بنجاح ', color: Colors.green);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => ShowMyConsultations()),
            );
          }
          if (state is AddQuestionError) {
            showToast(
                text: 'حدث خطأ أثناء إرسال الاستشارة \n يرجى المحاولة لاحقاً',
                color: Colors.red);
          }
        },
        builder: (context, state) {
          List<Consultation> allConsultationList =
              ConsultationCubit.get(context).allConsultationList;
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
                          child: state is GetAllQuestionsLoading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                )
                              : state is AddQuestionLoading
                                  ? Center(
                                      child: Column(
                                        children: [
                                          const Text(
                                            'يتم إرسال استشارتك',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: h * 0.05,
                                          ),
                                          const CircularProgressIndicator(
                                            color: kPrimaryColor,
                                          ),
                                        ],
                                      ),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'الأسئلة المتكررة',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Expanded(
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                itemCount:
                                                    allConsultationList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  ConsultationDetails(
                                                                      consultation:
                                                                          allConsultationList[
                                                                              index])));
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Text(
                                                          '- ${allConsultationList[index].question}',
                                                          maxLines: 3),
                                                    ),
                                                  );
                                                })),
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
                                          'طلب استشارة خاصة',
                                          style: TextStyle(fontSize: 15),
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
                                            hintText: 'أدخلي استشارتك هنا ',
                                            controller: questionController,
                                            context: context,
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.03,
                                        ),
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (questionController.text
                                                  .trim()
                                                  .isEmpty) {
                                                showToast(
                                                    text:
                                                        "يرجى كتابة الاستشارة أولاً",
                                                    color: Colors.amber);
                                              } else {
                                                ConsultationCubit.get(context)
                                                    .sendQuestion(
                                                        question:
                                                            questionController
                                                                .text);
                                              }
                                            },
                                            child: SizedBox(
                                              width: w * 0.6,
                                              height: h * 0.09,
                                              child: Card(
                                                color: kPrimaryColor2,
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
                                                              color:
                                                                  Colors.white,
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
