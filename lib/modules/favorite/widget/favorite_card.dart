import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/favoriteModel.dart';
import 'package:queen_care/network/local/cache_helper.dart';
import '../../../../core/utils/constant.dart';

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
    return SizedBox(
      height: h * 0.28,
      width: w * 0.38,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              imgUrl + favoriteModel.mission.image,
              height: h * 0.2,
              width: w * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: w * 0.3,
            child: Text(
              CacheHelper.getData(key: 'LOCALE') == "en"
                  ? favoriteModel.mission.enName
                  : favoriteModel.mission.name,
              textAlign: TextAlign.center,
              maxLines: 3,
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Text(
                //     '${favoriteModel.mission.price} ليرة',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 11.sp, color: kBlueGreen),
                //   ),
                // ),
                Expanded(child: Spacer()),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                        onTap: onPressed,
                        child: SvgPicture.asset(
                            'assets/icons/favorite_icon.svg'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
