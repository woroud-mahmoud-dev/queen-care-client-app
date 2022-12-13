import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/my_service.dart';

import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/modules/product/cubit/product_cubit.dart';

import 'package:queen_care/modules/product/widgets/counter_widget.dart';
class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key, required this.tabController,}) : super(key: key);
  final TabController tabController;
  // final ProductModel ? product;
  MyService myService=MyService();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  BlocProvider(
  create: (context) => ProductCubit(),
  child: BlocConsumer<ProductCubit, ProductState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: h,
        width: w,
        child: Column(

          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset('assets/icons/list.svg',height: 20,),
                    ),          const Icon(
                      Icons.shopping_bag_sharp,
                      color: black,
                    ),     const Spacer(),
                    IconButton(
                        onPressed: () {
                          tabController.animateTo(4);

                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_sharp,

                          color: black,
                        )),



                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: _buildSlider(),
            // ),
            Expanded(
              flex: 2,child:     Container(
              // height: h*0.3,
              margin: const EdgeInsets.all(5),

              decoration: BoxDecoration(
                  image: DecorationImage(image:
                  NetworkImage(imgUrlOLa+myService.getSelectedProduct!.image),fit: BoxFit.contain)
              ),
            ),),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [         Text(
                          myService.getSelectedCategory!.type,
                          style: TextStyle(fontSize: 20),
                        ),    Spacer(),      Text('4.5'),

                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: h*0.03,),
                    SizedBox(
                      width: w*0.8,
                      height: h*0.1,
                      child: GestureDetector(
                        onTap: (){
                          tabController.animateTo(6);
                        },
                        child:  Card(

                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(myService.getSelectedProduct!.name,style: TextStyle(color: Colors.black54,fontSize: 16),),
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
                            children:  [
                              Text(myService.getSelectedProduct!.cases,style: TextStyle(color: kPrimaryColor,fontSize: 16),),
                              Text(myService.getSelectedProduct!.price+'ريال',style: TextStyle(color: kPrimaryColor,fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.03,),
                    Row(
                      children: [
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
                          ), ),
                        Expanded(
                          flex: 1,
                          child: SelecInfotItem(
                            number: ProductCubit.get(context).productNumber,
                            col: kPrimaryColor,
                            onPressAdd: (){
                              ProductCubit.get(context).increaseProductNumber();
                            },
                            onPressMin: (){
                              ProductCubit.get(context).decreaseProductNumber();
                            },

                          ),
                        ),

                      ],
                    )

                  ],

                ),
              ),
            )
          ],
        ),
      ),
    );
  },
),
);
  }
  // Widget _buildSlider() {
  //   return Container(
  //     height: 120.0,
  //     child: Stack(
  //       children: <Widget>[
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: 20.0),
  //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
  //           child: Swiper(
  //             autoplay: true,
  //             itemBuilder: (BuildContext context, int index) {
  //               return Container(
  //                 margin: EdgeInsets.all(5),
  //
  //                 decoration: BoxDecoration(
  //                     image: DecorationImage(image: NetworkImage('https://karam-app.com/celo/queencare/public/storage/company_types/uploads/image638731908ef13_175203.png',),fit: BoxFit.contain)
  //                 ),
  //               );
  //             },
  //             itemCount: 3,
  //             fade: 0.9,
  //
  //             pagination: const SwiperPagination(
  //               builder: DotSwiperPaginationBuilder(
  //                 // color: Colors.black12,
  //                 activeColor: kPrimaryColor,
  //                 color: darkGrey,
  //                 activeSize: 10,
  //                 size: 8,
  //               ),
  //
  //
  //              alignment: Alignment.bottomCenter,
  //              margin: EdgeInsets.only(),
  //             ),
  //             viewportFraction: 1,
  //
  //             loop: false,
  //             scale: 0.9,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
