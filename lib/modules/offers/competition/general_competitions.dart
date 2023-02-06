import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/modules/offers/awards/award_after_finish.dart';
import 'package:queen_care/modules/offers/awards/loss_screen.dart';
import 'package:queen_care/modules/offers/competition/cubit/competition_cubit.dart';
import 'package:queen_care/modules/home/widgets/custom_stepper.dart';
import 'package:queen_care/modules/home/widgets/question_widget.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

class GeneralCompetitions extends StatelessWidget {
  final TabController tabController;
  const GeneralCompetitions({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CompetitionCubit()..getQuestions(),
      child: BlocConsumer<CompetitionCubit, CompetitionState>(
        listener: (context, state) {
          if (state is FinishStateWithWin) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => AwardAfterFinish(
                        prizeModel: state.prizeModel,
                      )),
            );
          }
          if (state is FinishStateWithLoss) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => LossScreen(
                        points: state.points,
                      )),
            );
          }
        },
        builder: (context, state) {
          int stepLength = CompetitionCubit.get(context).questionsList.length;
          List<Question> questionsList = CompetitionCubit.get(context).questionsList;
          return state is GetAllQuestionsLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : (state is SendResultStateLoading ||
                      state is FinishStateWithWin ||
                      state is FinishStateWithLoss)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'يتم الآن حساب النتيجة',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: h * 0.3,
                          ),
                          const CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      children: [
                        SearchBar(w: w),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'مسابقات عامة',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18,
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
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        NumberStepper(
                          totalSteps: stepLength,
                          width: MediaQuery.of(context).size.width,
                          curStep: CompetitionCubit.get(context).currentStep,
                          stepCompleteColor: Colors.green,
                          currentStepColor: Colors.white,
                          inactiveColor: darkGrey2,
                          lineWidth: 1,
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            questionsList[CompetitionCubit.get(context).indexQ].ques,
                            style: const TextStyle(
                                color: darkGrey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        QuestionWidget(
                          groupValue: CompetitionCubit.get(context).answerGroupValue,
                          name:
                              questionsList[CompetitionCubit.get(context).indexQ].a,
                          onChanged: (value) {
                            debugPrint(
                                'group value ${CompetitionCubit.get(context).answerGroupValue}');
                            debugPrint(
                                'a: ${questionsList[CompetitionCubit.get(context).indexQ].a}');
                            debugPrint(
                                'answer : ${questionsList[CompetitionCubit.get(context).indexQ].answer}');
                            CompetitionCubit.get(context).selectAnswer(
                                answer: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .a,
                                result: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .answer);
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .a);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .a);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                          },
                          value:
                              questionsList[CompetitionCubit.get(context).indexQ].a,
                        ),
                        QuestionWidget(
                          groupValue: CompetitionCubit.get(context).answerGroupValue,
                          name:
                              questionsList[CompetitionCubit.get(context).indexQ].b,
                          onChanged: (value) {
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .b);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                            CompetitionCubit.get(context).selectAnswer(
                                answer: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .b,
                                result: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .answer);
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .b);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                          },
                          value:
                              questionsList[CompetitionCubit.get(context).indexQ].b,
                        ),
                        QuestionWidget(
                          groupValue: CompetitionCubit.get(context).answerGroupValue,
                          name:
                              questionsList[CompetitionCubit.get(context).indexQ].c,
                          onChanged: (value) {
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .c);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                            CompetitionCubit.get(context).selectAnswer(
                                answer: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .c,
                                result: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .answer);
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .c);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                          },
                          value:
                              questionsList[CompetitionCubit.get(context).indexQ].c,
                        ),
                        QuestionWidget(
                          groupValue: CompetitionCubit.get(context).answerGroupValue,
                          name:
                              questionsList[CompetitionCubit.get(context).indexQ].d,
                          onChanged: (value) {
                            debugPrint(
                              CompetitionCubit.get(context).answerGroupValue,
                            );
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .d);
                            debugPrint(
                                questionsList[CompetitionCubit.get(context).indexQ]
                                    .answer);
                            CompetitionCubit.get(context).selectAnswer(
                                answer: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .d,
                                result: questionsList[
                                        CompetitionCubit.get(context).indexQ]
                                    .answer);
                          },
                          value:
                              questionsList[CompetitionCubit.get(context).indexQ].d,
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthButton(
                              onTap: () {
                                CompetitionCubit.get(context).onPressNext();
                              },
                              title: "التالي",
                              color: kPrimaryColor),
                        ),
                      ],
                    );
        },
      ),
    );
  }
}
