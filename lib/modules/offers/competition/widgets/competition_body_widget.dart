import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/modules/offers/competition/cubit/competition_cubit.dart';
import 'package:queen_care/modules/home/widgets/custom_stepper.dart';
import 'package:queen_care/modules/home/widgets/question_widget.dart';

class CompetitionBodyWidget extends StatelessWidget {
  const CompetitionBodyWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.stepLength,
    required this.questionsList,
  }) : super(key: key);

  final double h;
  final double w;
  final int stepLength;
  final List<Question> questionsList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'general_co'.tr(context),
            style: const TextStyle(
              color: kBlueGreen,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            'answer_questions_'.tr(context),
            style: const TextStyle(
              fontSize: 14,
            ),
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
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: h * 0.03,
        ),
        QuestionsAnswerWidget(
          groupValue: CompetitionCubit.get(context).answerGroupValue,
          name: questionsList[CompetitionCubit.get(context).indexQ].a,
          onChanged: (value) {
            debugPrint(
                'group value ${CompetitionCubit.get(context).answerGroupValue}');
            debugPrint(
                'a: ${questionsList[CompetitionCubit.get(context).indexQ].a}');
            debugPrint(
                'answer : ${questionsList[CompetitionCubit.get(context).indexQ].answer}');
            CompetitionCubit.get(context).selectAnswer(
                answer: questionsList[CompetitionCubit.get(context).indexQ].a,
                result:
                    questionsList[CompetitionCubit.get(context).indexQ].answer);
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].a);
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].a);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
          },
          value: questionsList[CompetitionCubit.get(context).indexQ].a,
        ),
        QuestionsAnswerWidget(
          groupValue: CompetitionCubit.get(context).answerGroupValue,
          name: questionsList[CompetitionCubit.get(context).indexQ].b,
          onChanged: (value) {
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].b);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
            CompetitionCubit.get(context).selectAnswer(
                answer: questionsList[CompetitionCubit.get(context).indexQ].b,
                result:
                    questionsList[CompetitionCubit.get(context).indexQ].answer);
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].b);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
          },
          value: questionsList[CompetitionCubit.get(context).indexQ].b,
        ),
        QuestionsAnswerWidget(
          groupValue: CompetitionCubit.get(context).answerGroupValue,
          name: questionsList[CompetitionCubit.get(context).indexQ].c,
          onChanged: (value) {
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].c);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
            CompetitionCubit.get(context).selectAnswer(
                answer: questionsList[CompetitionCubit.get(context).indexQ].c,
                result:
                    questionsList[CompetitionCubit.get(context).indexQ].answer);
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].c);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
          },
          value: questionsList[CompetitionCubit.get(context).indexQ].c,
        ),
        QuestionsAnswerWidget(
          groupValue: CompetitionCubit.get(context).answerGroupValue,
          name: questionsList[CompetitionCubit.get(context).indexQ].d,
          onChanged: (value) {
            debugPrint(
              CompetitionCubit.get(context).answerGroupValue,
            );
            debugPrint(questionsList[CompetitionCubit.get(context).indexQ].d);
            debugPrint(
                questionsList[CompetitionCubit.get(context).indexQ].answer);
            CompetitionCubit.get(context).selectAnswer(
                answer: questionsList[CompetitionCubit.get(context).indexQ].d,
                result:
                    questionsList[CompetitionCubit.get(context).indexQ].answer);
          },
          value: questionsList[CompetitionCubit.get(context).indexQ].d,
        ),
        SizedBox(
          height: h * 0.03,
        ),
        Center(
          child: CustomButton(
            title: "_next".tr(context),
            onTap: () {
              CompetitionCubit.get(context).onPressNext();
            },
            color: kPrimaryColor,
            width: w * 0.7,
            height: h * 0.07,
          ),
        ),
      ],
    );
  }
}
