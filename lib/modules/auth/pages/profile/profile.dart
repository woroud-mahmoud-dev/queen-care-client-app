import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/widget/global_widgets.dart';
import 'package:queen_care/modules/auth/pages/profile/edite_profile.dart';
import 'package:queen_care/modules/auth/pages/profile/widgets/profile_list_item.dart';
import 'package:queen_care/modules/auth/pages/splach/splach_screen.dart';
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
      padding: const EdgeInsets.all(20),
      width: w,
      height: h,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(),
              CustomTitleWidget(
                text: 'Personal_account'.tr(context),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: h * 0.1,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: h * 0.2,
              width: h * 0.2,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: const Color(0xffCCCCCC),
                          borderRadius: BorderRadius.circular(5))),
                  Positioned(
                      right: -10,
                      bottom: -10,
                      child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset('assets/icons/camera_icon.svg'),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h * 0.15,
          ),
          ProfileItem(
            iconNotImage: true,
            iconData: Icons.person,
            text: 'edite_profile'.tr(context),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => EditeProfile()));
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
              widget.tabController.animateTo(18);
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
