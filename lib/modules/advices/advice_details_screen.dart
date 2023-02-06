import 'package:flutter/material.dart';

import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

// ignore: must_be_immutable
class AdviceScreen extends StatelessWidget {
  AdviceScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  // final ProductModel ? product;
  MyService myService = MyService();
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
          child: SearchBar(w: w),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: w * 0.25,
            ),
            const Text(
              'النصائح',
              style: TextStyle(color: kPrimaryColor, fontSize: 17),
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
        Align(
          alignment: Alignment.topRight,
          child: Text(
            myService.getSelectedBlog!.name,
            style: const TextStyle(color: kPrimaryColor, fontSize: 16),
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
        Text(
          myService.getSelectedBlog!.body,
          style: const TextStyle(fontSize: 14, color: darkGrey),
        ),
      ],
    );

  }
}
