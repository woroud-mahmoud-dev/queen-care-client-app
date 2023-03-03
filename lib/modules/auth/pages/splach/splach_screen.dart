import 'package:flutter/material.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/modules/auth/pages/select_lan/select_lang.dart';
import 'package:queen_care/modules/convert_user_to_company/convert_done.dart';
import 'package:queen_care/network/local/cache_helper.dart';

import '../../../home/main_screen.dart';

class Splach extends StatefulWidget {
  const Splach({Key? key}) : super(key: key);

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (CacheHelper.getData(key: 'api_token') != null&&CacheHelper.getData(key: 'isCompany') == null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const MainScreen()),
          (route) => false,
        );
      } else if (CacheHelper.getData(key: 'isCompany') == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const ConvertDone()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => SelectLanguage()),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(70),
      child: Center(
        child: LogoImage(
          h: MediaQuery.of(context).size.height * 0.3,
          w: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    ));
  }
}
