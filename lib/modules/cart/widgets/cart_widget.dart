import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/utlis/strings.dart';
import 'package:queen_care/core/widget/custom_button.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';


class CartWidget extends StatelessWidget {

  final CartModel cartModel;
  final           List <int>numberOfItems ;

  final int productId;


  CartWidget({Key? key, required this.cartModel, required this.productId, required this.numberOfItems,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
        },
        builder: (context, state) {

          return Card(

            margin: const EdgeInsets.symmetric(vertical: 5),

            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0,top: 5),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(

                      children: [
                        SizedBox(width: w*0.2,
                          child: CachedNetworkImage(
                            key:UniqueKey(),
                            imageUrl: imgUrlOLa+cartModel.mission.image,
                            placeholder: (context, url) =>const Center(child: CircularProgressIndicator(
                              backgroundColor: Colors.transparent,


                              color: kPrimaryColor,
                              strokeWidth: 0.2,
                            )),
                            errorWidget: (context, url, error) =>const Icon(Icons.error,color: kPrimaryColor,),
                          ),
                        ),
                        const SizedBox(height: 3,),

                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 1),

                        child: SizedBox(
                          width: w*0.4,
                          child: Text(cartModel.mission.name

                            ,textAlign: TextAlign.start,maxLines: 2,style:  TextStyle(fontSize:12,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),

                        child: Text('${cartModel.mission.price} ليرة'

                          ,textAlign: TextAlign.center,style: const TextStyle(fontSize:12,
                              color: kPrimaryColor),
                        ),
                      ),
                      const SizedBox(height: 5,),


                    ],
                  ),
                   // SizedBox(width: w*0.1,),
                  Container(
                    margin: EdgeInsets.all(3),
                    height: 35,
                    width: 25,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(5),

                    ),
                    child: Center(
                      child: Text(
                        numberOfItems[productId].toString(),

                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  Column(children: [

                    halfCircleButton1(onTap: () {
                      print('productId is ${productId}');
                      CartCubit.get(context).increaseProductNumber(productId);
                    },
                      myicon: const Icon(Icons.add,color: Colors.white,size: 10,),),
                    const SizedBox(height: 3),
                    halfCircleButton(onTap: (){
                      print('hello');
                      // print(priceMap[0].id);
                      // print(priceMap[1].amount);
                      // print(priceMap[0].price);
                      CartCubit.get(context).decreaseProductNumber(productId);

                    },
                      myicon: const Icon(Icons.minimize,color: Colors.white,size: 10,),)

                  ],),
                  const SizedBox(width: 5,),
                  CircleButton(onTap: () {
CartCubit.get(context).deleteFromCart(cartModel.id);

                  },
                    myicon:const Icon(Icons.delete_outline,color: Colors.white,size: 15,) ,),
                  const SizedBox(width: 10,),





                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


