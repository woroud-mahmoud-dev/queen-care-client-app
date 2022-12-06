
import 'package:flutter/material.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/home/widgets/category_widget.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({
    Key? key,
    required this.categoriesList, required this.tabController,
  }) : super(key: key);

  final List<Category> categoriesList;
final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(clipBehavior: Clip.hardEdge,
          physics:const BouncingScrollPhysics(),

          shrinkWrap: true,
          itemBuilder: (BuildContext context, int int) {


            return CategoryWidget(
              catImg: categoriesList[int].image, catName: categoriesList[int].type, tabController:tabController ,


            );
          },

          itemCount: categoriesList.length),
    );
  }
}
