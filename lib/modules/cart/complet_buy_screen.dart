import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/widgets/show_products_part.dart';
import 'package:queen_care/network/local/chach_helper.dart';

class CompleteBuyScreen extends StatelessWidget {
  const CompleteBuyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    TextEditingController addressController = TextEditingController();
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocConsumer<CartCubit, CartState>(listener: (context, state) {
        if (state is DeleteFromCartSuccessState) {
          CartCubit.get(context).getAllCartsProduct();
        }
      }, builder: (context, state) {
        List<CartModel> allProducts = [
          CartModel(
            id: 1,
            mission: Mission(
                id: 1,
                price: '22',
                name: 'aaaaaaaa',
                image: '',
                description: 'a,s',
                cases: 'aa',
                type: 'o',
                state: 'a'),
            missionId: '1',
            userId: '11',
          ),
          CartModel(
            id: 2,
            mission: Mission(
                id: 2,
                price: '2002',
                name: 'ccccccc',
                image: '',
                description: 'a,s',
                cases: 'aa',
                type: 'o',
                state: 'a'),
            missionId: '2',
            userId: '11',
          ),        CartModel(
            id: 3,
            mission: Mission(
                id: 3,
                price: '2332',
                name: 'bbbbb',
                image: '',
                description: 'a,s',
                cases: 'aa',
                type: 'o',
                state: 'a'),
            missionId: '3',
            userId: '11',
          ),
        ];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(0.0),
            child: ListView(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'المشتريات',
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: w * 0.2,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              state is GetAllProductsLoadingState
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  : ShowCartProducts(
                      allOrders: allProducts,
                      numberOfItems: [2, 3, 4],
                      amountsList: [],
                    ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العنوان',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),), Text('تحرير العنوان',style: TextStyle(color: darkGrey),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextFormField(
                    textInputAction: TextInputAction.send,
                    keyboardType: TextInputType.text,
                    keyboardAppearance: Brightness.light,
                    initialValue:CacheHelper.getData(key: 'address') ,

                    controller: addressController,
                    validator: (value){
        // if (value!.isEmpty) {
        // return '';
        // }
        //


                    },
                    decoration: InputDecoration(
                      hintText: CacheHelper.getData(key: 'address') ,
                      prefixIconColor: kPrimaryColor,



                      //
                      //
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Text(' أضف ملاحظاتك',style: TextStyle(color: darkGrey),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.text,
                      keyboardAppearance: Brightness.light,
                      initialValue:CacheHelper.getData(key: 'address') ,

                      controller: addressController,
                      validator: (value){
                        // if (value!.isEmpty) {
                        // return '';
                        // }
                        //


                      },
                      decoration: InputDecoration(
                        hintText: CacheHelper.getData(key: 'address') ,
                        prefixIconColor: kPrimaryColor,



                        //
                        //
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                      ),
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.18,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),

                    // bottomRight: Radius.circular(20),
                    // bottomLeft: Radius.circular(20),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //must change this picture
                        Icon(Icons.save_sharp),
                        Text(
                          'المجموع',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '8282 ليرة',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: darkGrey2,
                        ),
                        SizedBox(
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
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
