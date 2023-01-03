import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/complet_buy_screen.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/widgets/show_products_part.dart';



// ignore: must_be_immutable
class CartScreen extends StatelessWidget {

   CartScreen({Key? key,
  }) : super(key: key);
  MyService myService=MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    int allMoney=0;
    return BlocProvider(
      create: (context) => CartCubit()..getAllCartsProduct(),
      child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {


   if(state is DecreaseProductNumberState|| state is IncreaseProductNumberState){
     CartCubit.get(context).countAllMoney(CartCubit.get(context).allCartsProductsList);
   }
          },
          builder: (context, state) {
            List<CartModel> allProducts=CartCubit.get(context).allCartsProductsList;
            allMoney =CartCubit.get(context).allMoney;
            return Scaffold(
              body:  Padding(
                padding: const EdgeInsets.all(0.0),
                child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const BackButton(),

                          const Align(
                            alignment: Alignment.topCenter,
                            child: Text('السلة',style: TextStyle(color: kPrimaryColor,fontSize: 18),),
                          ),
                          SizedBox(width: w*0.2,)
                        ],
                      ),

                      const SizedBox(height: 10,),

                      state is GetAllProductsLoadingState?SizedBox(
                        height: MediaQuery.of(context).size.height* 0.7,

                        child: const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ) :  ShowCartProducts( allOrders: allProducts,
                     numberOfItems:myService.getNumberOfItems!,
                      ),
                      const SizedBox(height: 20,),

                      Container(
                        padding: const EdgeInsets.all(20),
                        height: MediaQuery.of(context).size.height* 0.18,

                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),

                              // bottomRight: Radius.circular(20),
                              // bottomLeft: Radius.circular(20),
                            ),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                            ],),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                //must change this picture

                                const Text('المجموع',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold


                                  ),),
                                Text('$allMoney ليرة',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold

                                  ),),
                              ],),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
const Icon(Icons.arrow_forward_ios_sharp,color: darkGrey2,),


                              InkWell(
                                onTap: (){
                                  if( allProducts.isEmpty){
                                    showToast(text: 'السلة فارغة !', color: Colors.amber);
                                  }else{
                                    if(allMoney>0){
                                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CompleteBuyScreen(
                                        allProducts: allProducts,

                                      )));
                                    }else{
                                      showToast(text: 'قم باختيار العدد المطلوب من كل منتج', color: Colors.amber);
                                    }


                                  }

                                },
                                child: SizedBox(
                                  width: w * 0.4,
                                  height: h * 0.06,
                                  child: const Card(
                                    color: kPrimaryColor,
                                    elevation: 4,
                                    child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: Center(
                                        child: Text(
                                          'إتمام عملية الشراء ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],)
                          ],
                        ),
                      ),

                    ]),
              ),
            );
          }),
    );}}



