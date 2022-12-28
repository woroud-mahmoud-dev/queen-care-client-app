import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/modules/home/offers/awords/aword_after_finish.dart';
import 'package:queen_care/modules/home/offers/awords/loss_screen.dart';
import 'package:queen_care/modules/home/offers/cubit/offers_cubit.dart';
import 'package:queen_care/modules/home/widgets/custom_stepper.dart';
import 'package:queen_care/modules/home/widgets/question_widget.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

class GeneralCompetitions extends StatelessWidget {
  final TabController tabController;
  GeneralCompetitions({Key? key, required this.tabController})
      : super(key: key);

  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => OffersCubit()..getQuestions(),
      child: BlocConsumer<OffersCubit, OffersState>(
        listener: (context, state) {

          if (state is FinishStateWithWin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AwardAfterFinish()),

            );
          }
          if (state is FinishStateWithLoss) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LossScreen()),

            );
          }
        },
        builder: (context, state) {

          int stepLength = OffersCubit.get(context).questionsList.length;
          List<Question> questionsList = OffersCubit.get(context).questionsList;
          return state is GetAllQuestionsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  children: [
                    searchBar(w: w),

                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'مسابقات عامة',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'أجب عن الأسئلة للحصول على جائزة',
                        style: TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // const  Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Text('22:33',
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 14,
                    //         fontWeight: FontWeight.bold
                    //     ),),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),

                    NumberStepper(
                      totalSteps: stepLength,
                      width: MediaQuery.of(context).size.width,
                      curStep: OffersCubit.get(context).currentStep,
                      stepCompleteColor: Colors.green,
                      currentStepColor: Colors.white,
                      inactiveColor: darkGrey2,
                      lineWidth: 1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        questionsList[OffersCubit.get(context).indexQ].ques,
                        style: TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    QuestionWidget(
                      groupValue: OffersCubit.get(context).answerGroupValue,
                      name: questionsList[OffersCubit.get(context).indexQ].a,
                      onChanged: (value) {
                        print(
                            'grop value ${OffersCubit.get(context).answerGroupValue}');
                        print(
                            'a: ${questionsList[OffersCubit.get(context).indexQ].a}');
                        print(
                            'answer : ${questionsList[OffersCubit.get(context).indexQ].answer}');
                        OffersCubit.get(context).selectAnswer(
                            answer:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .a,
                            result:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .answer);
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].a);
                        print(questionsList[OffersCubit.get(context).indexQ].a);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                      },
                      value: questionsList[OffersCubit.get(context).indexQ].a,
                    ),
                    QuestionWidget(
                      groupValue: OffersCubit.get(context).answerGroupValue,
                      name: questionsList[OffersCubit.get(context).indexQ].b,
                      onChanged: (value) {
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].b);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                        OffersCubit.get(context).selectAnswer(
                            answer:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .b,
                            result:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .answer);
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].b);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                      },
                      value: questionsList[OffersCubit.get(context).indexQ].b,
                    ),
                    QuestionWidget(
                      groupValue: OffersCubit.get(context).answerGroupValue,
                      name: questionsList[OffersCubit.get(context).indexQ].c,
                      onChanged: (value) {
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].c);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                        OffersCubit.get(context).selectAnswer(
                            answer:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .c,
                            result:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .answer);
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].c);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                      },
                      value: questionsList[OffersCubit.get(context).indexQ].c,
                    ),
                    QuestionWidget(
                      groupValue: OffersCubit.get(context).answerGroupValue,
                      name: questionsList[OffersCubit.get(context).indexQ].d,
                      onChanged: (value) {
                        print(
                          OffersCubit.get(context).answerGroupValue,
                        );
                        print(questionsList[OffersCubit.get(context).indexQ].d);
                        print(questionsList[OffersCubit.get(context).indexQ]
                            .answer);
                        OffersCubit.get(context).selectAnswer(
                            answer:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .d,
                            result:
                                questionsList[OffersCubit.get(context).indexQ]
                                    .answer);
                      },
                      value: questionsList[OffersCubit.get(context).indexQ].d,
                    ),
                    // SizedBox(
                    //
                    //   child: ListView.builder(
                    //       physics: const BouncingScrollPhysics(),
                    //
                    //       shrinkWrap: true,
                    //       itemBuilder: (BuildContext context, int index) {
                    //         return QuestionWidget(
                    //
                    //           groupValue:
                    //           OffersCubit.get(context).answerGroupValue,
                    //           name: questionsList[index].answer,
                    //           onChanged: (value) {
                    //             OffersCubit.get(context).selectAnswer(value);
                    //           },
                    //           value: index,
                    //         );
                    //       },
                    //       itemCount: 1),
                    // ),
                    // const   SizedBox(height: 20,),

                    AuthButton(
                        onTap: () {
                          OffersCubit.get(context).onPressNext();
                        },
                        title: "التالي",
                        color: kPrimaryColor),
                  ],
                );
        },
      ),
    );
  }
}
