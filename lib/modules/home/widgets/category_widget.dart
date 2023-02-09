import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/category.dart';

class CategoryWidget extends StatelessWidget {

  final CategoryModel category;
  final  TabController tabController;
  CategoryWidget({Key? key, required this.tabController,  required this.category}) : super(key: key);
  final myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        myService.setSelectedCategory=category;
        tabController.animateTo(4);

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: w,
        height: h*0.14,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kBlueGreen),
        ),
        child: Stack(
          clipBehavior: Clip.none,

          children: [
            Positioned(
              top: 0,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,   boxShadow:  [
                  BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
                ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(7),
                    bottomLeft: Radius.circular(7),

                  ),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 10),

                height: h*0.06,
                width: w*0.25,

                child: Center(
                  child: Text(category.name

                    ,textAlign: TextAlign.center,style: const TextStyle(color: kBlueGreen,),  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: SizedBox(
                height: h*0.1,
                width: w*0.4,
                child: CachedNetworkImage(
                  key:UniqueKey(),
                  imageUrl: imgUrl+category.image,
                  placeholder: (context, url) =>const Center(child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,


                    color: kPrimaryColor,
                    strokeWidth: 0.2,
                  )),
                  errorWidget: (context, url, error) =>const Icon(Icons.error,color: kPrimaryColor,),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
