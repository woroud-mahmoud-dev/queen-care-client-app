import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/consultation_details_body.dart';
import 'package:queen_care/modules/consultation/Widgets/custom_top_widget.dart';
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

    return Scaffold(
      body: BlocProvider(
        create: (context) => ConsultationCubit(),
        child: BlocConsumer<ConsultationCubit, ConsultationState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: customBoxDecoration,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  CustomTopWidget(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (_) => ShowMyConsultations()),
                      );
                    },
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'consulting_details'.tr(context),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Expanded(
                    child: ConsultationDetailsBody(
                      h: h,
                      w: w,
                       consultation: consultation,

                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


