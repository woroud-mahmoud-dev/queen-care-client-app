import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/widget/go_cart.dart';
import 'package:queen_care/core/widget/loading_widget.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_widget.dart';
import 'package:queen_care/models/favoriteModel.dart';
import 'package:queen_care/modules/favorite/cubit/favorite_cubit.dart';
import 'package:queen_care/modules/favorite/widget/favorite_products.dart';

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
          if (state is DeleteFromFavoriteSuccessState) {
            FavoriteCubit.get(context).getAllFavoriteProductsWithHttp();
          }
        },
        builder: (context, state) {
          List<FavoriteModel> favoriteProductsList =
              FavoriteCubit.get(context).favoriteList;

          return Column(
            children: [
              SizedBox(height: h * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(
                    'favorite'.tr(context),
                    style: const TextStyle(fontSize: 17),
                  ),
                  const Spacer(),
                  const GoCart(),
                  SizedBox(width: w * 0.015),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  LogoImage(
                    w: w * 0.22,
                    h: h * 0.11,
                  ),
                ],
              ),
              state is GetFavoriteProductLoading
                  ? const Expanded(
                      child: LoadingWidget(),
                    )
                  : state is DeviceNotConnectedState
                      ? Expanded(
                          child: NoInternetWidget(
                            onPressed: () {
                              FavoriteCubit.get(context)
                                  .getAllFavoriteProductsWithHttp();
                            },
                          ),
                        )
                      : Expanded(
                          child: FavoriteProducts(
                              favoriteProductsList: favoriteProductsList,
                              h: h,
                              w: w),
                        ),
            ],
          );
        },
      ),
    );
  }
}
