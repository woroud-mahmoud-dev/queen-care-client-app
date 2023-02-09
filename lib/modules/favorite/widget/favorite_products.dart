import 'package:flutter/material.dart';

import 'package:queen_care/models/favoriteModel.dart';
import 'package:queen_care/modules/favorite/cubit/favorite_cubit.dart';
import 'package:queen_care/modules/favorite/widget/favorite_card.dart';
class FavoriteProducts extends StatelessWidget {
  const FavoriteProducts({
    Key? key,
    required this.favoriteProductsList,
    required this.h,
    required this.w,
  }) : super(key: key);

  final List<FavoriteModel> favoriteProductsList;
  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      childAspectRatio: (1 / 0.9),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: List.generate(favoriteProductsList.length,
              (int index) {
            return FavoriteCardWidget(
              h: h,
              w: w,
              onPressed: () {
                FavoriteCubit.get(context).deleteFromFavorite(
                    favoriteProductsList[index].mission.id);
              },
              favoriteModel: favoriteProductsList[index],
            );
          }),
    );
  }
}