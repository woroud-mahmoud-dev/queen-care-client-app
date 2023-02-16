import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/consultation.dart';
import 'package:queen_care/modules/consultation/Widgets/all_consultation_body.dart';
import 'package:queen_care/modules/consultation/Widgets/custom_top_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/modules/consultation/cubit/consultation_cubit.dart';
import 'package:queen_care/modules/home/main_screen.dart';

class ShowAllConsultations extends StatelessWidget {
  const ShowAllConsultations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => ConsultationCubit()..getAllQuestions(),
        child: BlocConsumer<ConsultationCubit, ConsultationState>(
          listener: (context, state) {},
          builder: (context, state) {
            List<Consultation> allConsultationsList =
                ConsultationCubit.get(context).allConsultationList;

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
                            style: TextStyle(fontSize: 14.sp),
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
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      height: h * 0.83,
                      decoration: customContainerBoxDecoration,
                      child: state is GetAllQuestionsLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: kPrimaryColor,
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Consulting'.tr(context),
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                                state is GetAllQuestionsLoading
                                    ? const Expanded(child: LoadingWidget())
                                    : state is DeviceNotConnectedState
                                        ? Expanded(child: NoInternetWidget(
                                            onPressed: () {
                                              ConsultationCubit.get(context)
                                                  .getAllQuestions();
                                            },
                                          ))
                                        : state is GetMyQuestionsError
                                            ? Expanded(child: Center(
                                                child: CustomErrorWidget(
                                                  onPressed: () {
                                                    ConsultationCubit.get(
                                                            context)
                                                        .getAllQuestions();
                                                  },
                                                ),
                                              ))
                                            : AllConsultationBody(
                                                allConsultationsList:
                                                    allConsultationsList,
                                                h: h,
                                                w: w),
                                SizedBox(
                                  height: h * 0.03,
                                ),
                              ],
                            ),
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
