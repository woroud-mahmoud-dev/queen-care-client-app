
import 'package:flutter/material.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/home/widgets/category_widget.dart';

class CategoriesPart extends StatelessWidget {
  const CategoriesPart({
    Key? key,
    required this.categoriesList,
  }) : super(key: key);

  final List<Category> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: ListView.builder(clipBehavior: Clip.hardEdge,
          physics:const BouncingScrollPhysics(),

          shrinkWrap: true,
          itemBuilder: (BuildContext context, int int) {


            return CategoryWidget(
              catImg: categoriesList[int].image, catName: categoriesList[int].type,


            );
          },

          itemCount: categoriesList.length),
    );
  }
}
