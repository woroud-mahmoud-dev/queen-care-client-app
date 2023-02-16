import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_widget.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/cat_blog_model.dart';
import 'package:queen_care/modules/advices/cubit/advice_cubit.dart';
import 'package:queen_care/modules/advices/widgets/blogs_part.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

class ShowAdvicesScreen extends StatelessWidget {
  final TabController tabController;
  const ShowAdvicesScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AdviceCubit()..getCategoryWithHttp(),
      child: BlocConsumer<AdviceCubit, AdviceState>(
        listener: (context, state) {},
        builder: (context, state) {
          final List<CategoryBlogModel> categoriesList =
              AdviceCubit.get(context).categoriesList;
          final List<Tab> tabList = List.generate(
              categoriesList.length,
              (index) => Tab(
                    child: Center(
                        child: Text(
                      categoriesList[index].name,
                    )),
                  ));
          final kTabPages = List.generate(
              tabList.length,
              (index) => BlogsPart(
                    index: index,
                    tabController: tabController,
                  ));

          return DefaultTabController(
            initialIndex: 0,
            length: categoriesList.length,
            child: ListView(
              children: [
                SizedBox(
                  height: h * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SearchBar(w: w),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'advices'.tr(context),
                    style: TextStyle(color: kBlueGreen, fontSize: 17.sp),
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                state is GetCategoriesLoading ||
                        state is DeviceNotConnectedState
                    ? Container()
                    : Directionality(
                        textDirection: TextDirection.rtl,
                        child: TabBar(
                          onTap: (int index) {
                            debugPrint(index.toString());
                          },
                          labelColor: kPrimaryColor,
                          labelStyle: TextStyle(fontSize: 14.sp),
                          unselectedLabelColor: darkGrey2,
                          tabs: tabList,
                          indicatorColor: kPrimaryColor,
                          indicatorWeight: 2,
                          isScrollable: true,
                        ),
                      ),
                const Divider(color: kPrimaryColor, height: 0, thickness: 2.5),
                state is GetCategoriesLoading
                    ? SizedBox(height: h * 0.65, child: const LoadingWidget())
                    : state is DeviceNotConnectedState
                        ? NoInternetWidget(
                            onPressed: () {
                              AdviceCubit.get(context).getCategoryWithHttp();
                            },
                          )
                        : state is GetCategoriesError
                            ? CustomErrorWidget(
                                onPressed: () {
                                  AdviceCubit.get(context)
                                      .getCategoryWithHttp();
                                },
                              )
                            : Directionality(
                                textDirection: TextDirection.rtl,
                                child: SizedBox(
                                  height: h * 0.65,
                                  child: TabBarView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: kTabPages,
                                  ),
                                ),
                              ),
              ],
            ),
          );
        },
      ),
    );
  }
}
