import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/question.dart';
import 'package:queen_care/modules/offers/awards/award_after_finish.dart';
import 'package:queen_care/modules/offers/awards/loss_screen.dart';
import 'package:queen_care/modules/offers/competition/cubit/competition_cubit.dart';
import 'package:queen_care/modules/offers/competition/widgets/competition_body_widget.dart';
import 'package:queen_care/modules/offers/competition/widgets/score_calculate_widget.dart';

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
          if (state is DeviceNotConnectedToSendResultState) {
            showSnackBar(context);
          }
          if (state is GetResultErrorState) {
            showErrorSnackBar(context);
          }
        },
        builder: (context, state) {
          int stepLength = CompetitionCubit.get(context).questionsList.length;
          List<Question> questionsList =
              CompetitionCubit.get(context).questionsList;
          return state is GetAllQuestionsLoadingState
              ? const Center(child: LoadingWidget())
              : state is DeviceNotConnectedState
                  ? Center(
                      child: NoInternetWidget(
                        onPressed: () {
                          CompetitionCubit.get(context).getQuestions();
                        },
                      ),
                    )
                  : state is GetAllQuestionsErrorState
                      ? Center(
                          child: CustomErrorWidget(
                            onPressed: () {
                              CompetitionCubit.get(context).getQuestions();
                            },
                          ),
                        )
                      : (state is SendResultStateLoading ||
                              state is FinishStateWithWin ||
                              state is FinishStateWithLoss)
                          ? ScoreCalculateWidget(h: h)
                          : CompetitionBodyWidget(
                              h: h,
                              stepLength: stepLength,
                              questionsList: questionsList, w: w,);
        },
      ),
    );
  }
}
