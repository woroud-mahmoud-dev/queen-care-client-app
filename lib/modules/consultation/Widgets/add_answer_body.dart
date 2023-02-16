import 'package:flutter/material.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/text_filed.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';

class AddAnswerBody extends StatelessWidget {
  const AddAnswerBody(
      {Key? key,
      required this.w,
      required this.h,
      required this.answerController,
      required this.state,
      required this.consultation})
      : super(key: key);
  final double w;
  final double h;
  final TextEditingController answerController;
  final ConsultationState state;
  final Consultation consultation;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: h * 0.795,
        decoration: customContainerBoxDecoration,
        child: state is AddAnswerLoading
            ? const LoadingWidget()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'counseling'.tr(context),
                        style: const TextStyle(fontSize: 17),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              consultation.question,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
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
                  Row(
                    children: [
                      Text(
                        'consulting_answer'.tr(context),
                        style: const TextStyle(fontSize: 17),
                      ),
                      const Spacer(),
                    ],
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
                      hintText: 'enter_answer'.tr(context),
                      controller: answerController,
                      context: context,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Center(
                    child: CustomButton(
                      title: 'send'.tr(context),
                      onTap: () {
                        if (answerController.text.trim().isEmpty) {
                          showToast(
                              text: "write_an".tr(context), color: kBlueGreen);
                        } else {
                          ConsultationCubit.get(context).sendAnswer(
                              questionId: consultation.id,
                              answer: answerController.text);
                        }
                      },
                      color: kPrimaryColor,
                      width: w * 0.7,
                      height: h * 0.07,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                ],
              ),
      ),
    );
  }
}
