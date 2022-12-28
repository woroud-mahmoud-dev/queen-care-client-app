import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
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
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final List<CategoryBlogModel> categoriesList =AdviceCubit.get(context).categories_list;
          final List<Tab> tabList = List.generate(categoriesList.length, (index) =>
              Tab(

                child: Center(child: Text(categoriesList[index].name,)),

              ));
          final kTabPages =List.generate(tabList.length, (index) => BlogsPart(
            index: index,
            tabController: tabController,

          ));


          return DefaultTabController(

            initialIndex: 0,


            length: categoriesList.length,

            child: Column(
              children: [
                SizedBox(height: h*0.02,),

                Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: searchBar(w: w),
                     ),
                const Align(
                  alignment: Alignment.center,
                  child: Text('النصائح', style: TextStyle(
                      color: kPrimaryColor,
                    fontSize: 18
                  ),),
                ),
                SizedBox(height: h*0.02,),

                state is GetCategoriesLoading?Container() :Directionality(
                  textDirection: TextDirection.rtl,

                  child: TabBar(

onTap: (int index){
  debugPrint(index.toString());
},
                    labelColor: kPrimaryColor,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                    unselectedLabelColor: darkGrey2,
                    tabs: tabList,
                    indicatorColor: kPrimaryColor,

indicatorWeight: 2,                        isScrollable: true,
                  ),
                ),
                state is GetCategoriesLoading?Container(

                ) :const Divider(color: kPrimaryColor,height:0,thickness: 2.5),
                Directionality(
                  textDirection: TextDirection.rtl,

                  child: SizedBox(
                    height: h*0.65,
                    child: TabBarView(


                      physics:const NeverScrollableScrollPhysics(),
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

