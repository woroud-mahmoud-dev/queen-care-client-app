import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/modules/home/widgets/custom_search_bar.dart';


class AdviceScreen extends StatelessWidget {
  AdviceScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  final myService = MyService();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: h * 0.01,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomSearchBar(w: w),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: w * 0.25,
            ),
            const Text(
              'النصائح',
              style: TextStyle(color: kBlueGreen, fontSize: 17),
            ),
            IconButton(
                onPressed: () {
                  tabController.animateTo(16);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: black,
                )),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            myService.getSelectedBlog!.name,
            textAlign: TextAlign.center,

            style:  TextStyle( fontSize: 14.sp),
          ),
        ),
        SizedBox(
          height: h * 0.02,
        ),
        Container(
          height: h * 0.4,

          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage(imgUrl + myService.getSelectedBlog!.image),
                  fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            myService.getSelectedBlog!.body,
            textAlign: TextAlign.center,
            style:  TextStyle(fontSize: 14.sp, ),
          ),
        ),
      ],
    );

  }
}
