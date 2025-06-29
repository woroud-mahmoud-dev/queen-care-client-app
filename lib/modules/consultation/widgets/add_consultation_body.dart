import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/frequently_asked_questions_widget.dart';
import 'package:queen_care/modules/consultation/Widgets/text_filed.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';

class AddConsultationBody extends StatelessWidget {
  const AddConsultationBody({
    Key? key,
    required this.allConsultationList,
    required this.w,
    required this.h,
    required this.questionController,
    required this.state,
  }) : super(key: key);

  final List<Consultation> allConsultationList;
  final double w;
  final double h;
  final TextEditingController questionController;
  final ConsultationState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'f_a_q'.tr(context),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Spacer(),
          ],
        ),
        state is GetAllQuestionsError
            ? Expanded(child: CustomErrorWidget(
                onPressed: () {
                  ConsultationCubit.get(context).getAllQuestions();
                },
              ))
            : state is GetAllQuestionsLoading
                ? const Expanded(child: LoadingWidget())
                : state is DeviceNotConnectedState
                    ? Expanded(child: NoInternetWidget(
                        onPressed: () {
                          ConsultationCubit.get(context).getAllQuestions();
                        },
                      ))
                    : FrequentlyAskedQuestionsWidget(
                        allConsultationList: allConsultationList),
        Divider(
          color: darkGrey2,
          thickness: 2,
          endIndent: w * 0.02,
          indent: w * 0.02,
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'r_p_c'.tr(context),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const Spacer(),
          ],
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Center(
          child: ConsultationTextField(
            maxLines: 4,
            h: h * 0.2,
            w: w * 0.8,
            hintText: 'enter_consultation'.tr(context),
            controller: questionController,
            context: context,
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Center(
          child: CustomButton(
            title: 'send'.tr(context),
            onTap: () {
              if (questionController.text.trim().isEmpty) {
                showToast(
                    text: "اً", color: kBlueGreen);
              } else {
                ConsultationCubit.get(context)
                    .sendQuestion(question: questionController.text);
              }
            },
            color: kPrimaryColor,
            width: w * 0.7,
            height: h * 0.07,
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
      ],
    );
  }
}
