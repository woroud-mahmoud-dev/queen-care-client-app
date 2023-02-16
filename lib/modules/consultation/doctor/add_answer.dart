import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/add_answer_body.dart';
import 'package:queen_care/modules/consultation/Widgets/custom_top_widget.dart';
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

    return Scaffold(
      body: BlocProvider(
        create: (context) => ConsultationCubit(),
        child: BlocConsumer<ConsultationCubit, ConsultationState>(
          listener: (context, state) {
            if (state is AddAnswerSuccess) {
              showToast(
                  text: 'sent_answer_success'.tr(context), color: kBlueGreen);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ShowAllConsultations()),
              );
            }
            if (state is AddAnswerError) {
              showErrorSnackBar(context);
            }
            if (state is DeviceNotConnectedToSendState) {
              showSnackBar(context);
            }
          },
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: customBoxDecoration,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.02,
                    ),
                    CustomTopWidget(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const MainScreen()),
                        );
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'consultation'.tr(context),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        LogoImage(
                          w: w * 0.22,
                          h: h * 0.11,
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    AddAnswerBody(
                      h: h,
                      w: w,
                      consultation: consultation,
                      state: state,
                      answerController: answerController,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
