import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:queen_care/core/utlis/constant.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;
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
              IconButton(
                  onPressed: () {
                    tabController.animateTo(5);

                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: black,
                  )),
              const Spacer(),
              const Icon(
                Icons.shopping_bag_sharp,
                color: black,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SvgPicture.asset('assets/icons/list.svg',height: 20,),
              ),
            ],
          ),
        ),
        Container(
          height: h*0.3,
          margin: const EdgeInsets.all(5),

          decoration:const BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://karam-app.com/celo/queencare/public/storage/company_types/uploads/image638731908ef13_175203.png',),fit: BoxFit.contain)
          ),
        ),
        Container(
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
                children: const[

                   Text('فوط كوين النهارية بالأجنحة',style:  TextStyle(fontSize: 18),),

                ],
              ),
              SizedBox(height: h*0.03,),
              const Directionality(
                textDirection: TextDirection.rtl,
                child:   Text(  " فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة   فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  ",
                  style:  TextStyle(fontSize: 16,color: darkGrey),),
              ),
              SizedBox(height: h*0.03,),
              const Text(      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style:  TextStyle(fontSize: 16,color: darkGrey),),


            ],

          ),
        )
      ],
    );
  }

}
