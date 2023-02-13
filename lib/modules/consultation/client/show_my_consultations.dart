import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queen_care/core/app_localization.dart';

import 'package:queen_care/core/utils/constant.dart';

import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/custom_top_widget.dart';
import 'package:queen_care/modules/consultation/Widgets/my_consultation_widget.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class ShowMyConsultations extends StatelessWidget {
  ShowMyConsultations({
    Key? key,
  }) : super(key: key);

  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ConsultationCubit()..getMyQuestions(),
        child: BlocConsumer<ConsultationCubit, ConsultationState>(
          listener: (context, state) {},
          builder: (context, state) {
            List<Consultation> myConsultationsList =
                ConsultationCubit.get(context).myConsultationList;
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: customBoxDecoration,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                    AllMyConsultationsWidget(
                      state: state,
                      w: w,
                      h: h,
                      myConsultationsList: myConsultationsList,
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
