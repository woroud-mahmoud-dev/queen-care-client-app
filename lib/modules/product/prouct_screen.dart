import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/product/product_detailes.dart';
import 'package:queen_care/modules/product/widgets/counter_widget.dart';
class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(

        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
             IconButton(onPressed: (){

               Navigator.of(context).pop();
             },icon: Icon(Icons.arrow_back_ios,color: darkGrey,)),
                const    Spacer(),
                const    Icon(Icons.shopping_bag_sharp,color: darkGrey,),
                const     Icon(Icons.list,color: darkGrey,),
                  ],
            ),
          ),
          Expanded(
            flex: 4,
            child: _buildSlider(),
          ),
          Expanded(
            flex: 5,
            child: Container(
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
                    children: [
                      Icon(Icons.star,color: Colors.amber,),
                      Text('4.5'),
                      Spacer(),
                      Text('فوط صحية شهرية',style: TextStyle(fontSize: 18),),

                    ],
                  ),
                  SizedBox(height: h*0.03,),
                  SizedBox(
                    width: w*0.8,
                    height: h*0.1,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetails()));
                      },
                      child: const Card(

                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('فوط كوين النهارية بالأجنحة ',style: TextStyle(color: Colors.black54,fontSize: 16),),
                          ),
                        ),
                      ),
                    ),
                  ),                               SizedBox(height: h*0.03,),


                  SizedBox(
                    width: w*0.8,
                    height: h*0.1,
                    child: Card(

                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('6 pieces',style: TextStyle(color: kPrimaryColor,fontSize: 16),),
                            Text('ريال 544',style: TextStyle(color: kPrimaryColor,fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h*0.03,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SelecInfotItem(
                          number: 13,
                          col: kPrimaryColor,
                          onPressAdd: (){},
                          onPressMin: (){},

                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child:               SizedBox(
                          width: w*0.72,
                          height: h*0.1,
                          child: Card(
color: kPrimaryColor,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.shopping_cart,color: Colors.white,),
                                    Text('إضافة إلى السلة ',style: TextStyle(color: Colors.white,fontSize: 16),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ), )
                    ],
                  )

                ],

              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildSlider() {
    return Container(
      height: 120.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5),

                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage('https://karam-app.com/celo/queencare/public/storage/company_types/uploads/image638731908ef13_175203.png',),fit: BoxFit.contain)
                  ),
                );
              },
              itemCount: 3,
              fade: 0.9,

              pagination: const SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  // color: Colors.black12,
                  activeColor: kPrimaryColor,
                  color: darkGrey,
                  activeSize: 10,
                  size: 8,
                ),


               alignment: Alignment.bottomCenter,
               margin: EdgeInsets.only(),
              ),
              viewportFraction: 1,

              loop: false,
              scale: 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
