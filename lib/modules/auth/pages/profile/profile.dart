import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/widget/screen_title.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/modules/auth/pages/profile/edite_profile.dart';
import 'package:queen_care/modules/auth/pages/profile/widgets/profile_list_item.dart';
import 'package:queen_care/modules/auth/pages/splach/splach_screen.dart';
import 'package:queen_care/modules/convert_user_to_company/convert_to_company.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      width: w,
      height: h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              ScreenTitle(
                text: 'Personal_account'.tr(context),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: h * 0.1.h,
          ),
          LogoImage(
            w: w * 0.5,
            h: h * 0.2,
          ),
          SizedBox(
            height: h * 0.05,
          ),
          ProfileItem(
            iconNotImage: true,
            iconData: Icons.person,
            text: 'edite_profile'.tr(context),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => EditProfile()));
            },
          ),
          SizedBox(
            height: h * 0.05,
          ),
          ProfileItem(
            iconData: Icons.compare_arrows,
            iconNotImage: true,
            text: 'Transfer_to_company'.tr(context),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const ConvertToCompany()));

            },
          ),
          SizedBox(
            height: h * 0.05,
          ),
          ProfileItem(
            iconNotImage: true,
            iconData: Icons.calendar_month_sharp,
            text: 'period_calculator'.tr(context),
            onTap: () {
              widget.tabController.animateTo(7);
            },
          ),
          SizedBox(
            height: h * 0.05,
          ),
          ProfileItem(
            iconNotImage: true,
            iconData: Icons.login_outlined,
            text: 'log_out'.tr(context),
            onTap: () {
              CacheHelper.removeData(key: 'api_token');
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const Splach()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
