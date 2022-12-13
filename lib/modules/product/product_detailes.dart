import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/utlis/strings.dart';
class ProductDetails extends StatelessWidget {
   ProductDetails({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
  MyService  myService=MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  ListView(
      physics: const BouncingScrollPhysics(),

      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset('assets/icons/list.svg',height: 20,),
              ),              const Icon(
                Icons.shopping_bag_sharp,
                color: black,
              ),              const Spacer(),

              IconButton(
                  onPressed: () {
                    tabController.animateTo(5);

                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: black,
                  )),


            ],
          ),
        ),
        Container(
          height: h*0.3,
          margin: const EdgeInsets.all(5),

          decoration: BoxDecoration(
              image: DecorationImage(image:
              NetworkImage(imgUrlOLa+myService.getSelectedProduct!.image),fit: BoxFit.contain)
          ),
        ),
        Container(
          height: h*0.6,
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),

          decoration: const BoxDecoration(
            color: Colors.white,   boxShadow:  [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
          ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),

            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                   Text(myService.getSelectedProduct!.name,style:  TextStyle(fontSize: 18),),

                ],
              ),
              SizedBox(height: h*0.03,),
               Text(    myService.getSelectedProduct!.description,
                 style:  TextStyle(fontSize: 16,color: darkGrey),),
              // SizedBox(height: h*0.03,),
              // const Text(      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              //   style:  TextStyle(fontSize: 16,color: darkGrey),),


            ],

          ),
        )
      ],
    );
  }

}
