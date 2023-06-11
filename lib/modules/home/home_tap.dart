import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/home/cubit/home_tap_cubit.dart';
import 'package:queen_care/modules/home/widgets/categories_part.dart';
import 'package:queen_care/modules/home/widgets/copon_widget.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List<CategoryModel> categoriesList = [];
    return BlocProvider(
      create: (context) => HomeTapCubit()..getCategoryWithHttp(),
      child: BlocConsumer<HomeTapCubit, HomeTapState>(
        listener: (context, state) {
          if (state is GetCategoriesSuccess) {
            categoriesList = state.categoriesList;
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const GoCart(),
                      SearchBar(w: w * 0.8),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
            
                  Row(
                    children: [
                      Text(
                        'categories'.tr(context),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: kBlueGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: state is GetCategoriesLoading
                        ? const LoadingWidget()
                        : state is DeviceNotConnectedState
                            ? NoInternetWidget(
                                onPressed: () {
                                  HomeTapCubit.get(context)
                                      .getCategoryWithHttp();
                                },
                              )
                            : state is GetCategoriesError
                                ? CustomErrorWidget(
                                    onPressed: () {
                                      HomeTapCubit.get(context)
                                          .getCategoryWithHttp();
                                    },
                                  )
                                : CategoriesPart(
                                    categoriesList: categoriesList,
                                    tabController: tabController),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
