import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/blog_model.dart';

class BlogWidget extends StatelessWidget {
  final BlogModel blogModel;
  final TabController tabController;
  BlogWidget({Key? key, required this.tabController, required this.blogModel})
      : super(key: key);
  final myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        myService.setSelectedBlog = blogModel;
        tabController.animateTo(17);
      },
      child: SizedBox(
        height: h * 0.2,
        width: w,
        child: Card(
          elevation: 5,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ) ,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blogModel.name,

                        style:  TextStyle(
                            color: darkGrey,
                            fontSize: 13.sp,
                    ),
                      ),
                      Text(
                        blogModel.body,

                        overflow: TextOverflow.ellipsis,
                        style:  TextStyle(

                            fontSize: 11.sp,
                 ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: imgUrl + blogModel.image,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    color: kPrimaryColor,
                    strokeWidth: 0.2,
                  )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
