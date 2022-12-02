import 'package:flutter/material.dart';

import 'package:queen_care/core/utlis/constant.dart';
class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),

        children: [
          Row(
            children: [
              IconButton(onPressed: (){
                Navigator.of(context).pop();

              },icon: Icon(Icons.arrow_back_ios,color: darkGrey,)),
              const    Spacer(),
              const    Icon(Icons.shopping_bag_sharp,color: darkGrey,),
              const     Icon(Icons.list,color: darkGrey,),
            ],
          ),
          Container(
            height: h*0.38,
            margin: const EdgeInsets.all(5),

            decoration:const BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://karam-app.com/celo/queencare/public/storage/company_types/uploads/image638731908ef13_175203.png',),fit: BoxFit.contain)
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),

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

                    Text('فوط كوين النهارية بالأجنحة',style: TextStyle(fontSize: 18),),

                  ],
                ),
                SizedBox(height: h*0.03,),
                    Directionality(
                  textDirection: TextDirection.rtl,
                  child:  Text(  " فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة   فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  فوط كوين النهارية بالأجنحة  ... فوط كوين النهارية بالأجنحة  ",
                    style: TextStyle(fontSize: 16,color: darkGrey),),
                ),
                SizedBox(height: h*0.03,),
                 Text(      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(fontSize: 16,color: darkGrey),),


              ],

            ),
          )
        ],
      ),
    );
  }

}
