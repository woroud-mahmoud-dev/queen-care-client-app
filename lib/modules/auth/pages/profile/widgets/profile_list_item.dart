
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utils/constant.dart';

class ProfileItem extends StatelessWidget {
  final String? img;
  final IconData? iconData;
  final String text;
  final bool? iconNotImage;

  final void Function()? onTap;
  const ProfileItem(
      {Key? key,
        this.img,
        required this.text,
        required this.onTap,
        this.iconNotImage,
        this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffF5F6F9),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [


            Text(text),
            const Spacer(),
            const SizedBox(
              width: 20,
            ),
            iconNotImage == true
                ? Icon(
              iconData!,
              size: 30,
              color: kPrimaryColor,
            )
                : SvgPicture.asset(img!),


          ],
        ),
      ),
    );
  }
}