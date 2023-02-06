import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/favoriteModel.dart';

import '../../../core/utils/constant.dart';

class FavoriteCardWidget extends StatelessWidget {
  const FavoriteCardWidget({
    Key? key,
    required this.h,
    required this.w,
    required this.onPressed,
    required this.favoriteModel,
  }) : super(key: key);
  final FavoriteModel favoriteModel;
  final double h;
  final double w;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h * 0.25,
      margin: const EdgeInsets.all(5),
      width: w * 0.38,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              imgUrl + favoriteModel.mission.image,
              height: h * 0.2,
              width: w * 0.35,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    flex: 5,
                    child: FittedBox(
                        child: Text(
                      favoriteModel.mission.name,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12),
                    ))),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: onPressed,
                        child: SvgPicture.asset(
                            'assets/icons/favorite_icon.svg'))),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: FittedBox(
                child: Text(
                  '${favoriteModel.mission.price} ليرة',
                  style: const TextStyle(fontSize: 14, color: kPrimaryColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
