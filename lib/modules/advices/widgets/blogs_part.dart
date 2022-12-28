import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/models/blog_model.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/advices/cubit/advice_cubit.dart';
import 'package:queen_care/modules/advices/widgets/blog_widget.dart';
import 'package:queen_care/modules/home/widgets/category_widget.dart';

class BlogsPart extends StatelessWidget {
  const BlogsPart({
    Key? key,
    required this.index, required this.tabController,
  }) : super(key: key);

  final int index;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdviceCubit()..getBlogByIdWithHttp(index),
      child: BlocConsumer<AdviceCubit, AdviceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
           final List<BlogModel> blogsList=AdviceCubit.get(context).blogsList;

          return
            state is GetBlogsLoading ?const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            ) :SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.7,
            child: ListView.builder(clipBehavior: Clip.hardEdge,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(15),

                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return BlogWidget(tabController: tabController,
                    blogModel: blogsList[index],


                  );
                },

                itemCount: blogsList.length),
          );
        },
      ),
    );
  }
}
