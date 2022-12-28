import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/models/favoriteModel.dart';
import 'package:queen_care/models/product.dart';
import 'package:queen_care/modules/home/favorite/cubit/favorite_cubit.dart';
import 'package:queen_care/modules/home/favorite/favorite_card.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
  create: (context) => FavoriteCubit()..getAllFavoriteProductsWithHttp(),

  child: BlocConsumer<FavoriteCubit, FavoriteState>(
  listener: (context, state) {
if(state is DeleteFromFavoriteSuccessState){
  FavoriteCubit.get(context).getAllFavoriteProductsWithHttp();
}

},
  builder: (context, state) {
    List<FavoriteModel>favoriteProductsList =FavoriteCubit.get(context).favoriteList;
    return Column(
      children: [
        SizedBox(
            height:
            h*0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            Icon(Icons.list),
            Text('المفضلة',style: TextStyle(fontSize: 19),),
            Icon(Icons.shopping_bag),
          ],
        ),
        state is GetFavoriteProductLoading?const Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,


            color: kPrimaryColor,

          )),
        ):     Expanded(
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            childAspectRatio: (1 / 0.9),
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            children: List.generate(favoriteProductsList.length, ( int index ) {
              return FavoriteCardWidget(h: h, w: w,
      onPressed: (){
        FavoriteCubit.get(context).deleteFromFavorite(
            favoriteProductsList[index].mission.id
        );

      },
              favoriteModel: favoriteProductsList[index],);
            }),
          ),
        ),

      ],
    );
  },
),
);
  }
}

