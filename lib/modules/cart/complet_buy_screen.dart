import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/core/widget/toast.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/order_done.dart';
import 'package:queen_care/modules/cart/widgets/show_products_part.dart';
import 'package:queen_care/network/local/chach_helper.dart';

class CompleteBuyScreen extends StatelessWidget {
  CompleteBuyScreen({
    Key? key,
    required this.allProducts,
  }) : super(key: key);
  TextEditingController addressController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  final List<CartModel> allProducts;
  MyService myService = MyService();
  int allMoney = 0;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CartCubit()..countAllMoney(allProducts),
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddOrderSuccessState) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const OrderDone()),
                (route) => false);
          } else if (state is AddOrderErrorState) {
            showToast(color: Colors.red, text: 'حدث خطأ يرجى المحاولة مجدداً');
          }
        },
        builder: (context, state) {

          allMoney = CartCubit.get(context).allMoney;
          List<Map<String, dynamic>> list =
              List.generate(allProducts.length, (index) {
            return {
              'amount': myService.getNumberOfItems![index],
              'price': allProducts[index].mission.price,
              'id': allProducts[index].missionId,
            };
          });
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(0.0),
              child: ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButton(),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'إتمام عملة الشراء',
                        style: TextStyle(color: kPrimaryColor, fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    )
                  ],
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'المشتريات',
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ShowCartProducts2(
                  allOrders: allProducts,
                  numberOfItems: myService.getNumberOfItems!,

                ),
                 SizedBox(
                  height: h*0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'العنوان',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'تحرير العنوان',
                        style: TextStyle(color: darkGrey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.light,
                        controller: addressController,
                        decoration: InputDecoration(
                          hintText: CacheHelper.getData(key: 'address'),
                          prefixIconColor: kPrimaryColor,
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        ' أضف ملاحظاتك',
                        style: TextStyle(color: darkGrey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        textInputAction: TextInputAction.send,
                        keyboardType: TextInputType.text,
                        keyboardAppearance: Brightness.light,
                        controller: noteController,
                        decoration: const InputDecoration(
                          hintText: 'اكتب ملاحظاتك هنا',
                          prefixIconColor: kPrimaryColor,

                          //
                          //
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                          ),
                        ),
                      )),
                ),
                SizedBox(
                  height: h*0.05,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 10),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          //must change this picture

                          const      Text(
                            'المجموع',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${allMoney} ليرة',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      ( state is AddOrderLoadingState|| state is AddOrderSuccessState)?const Padding(
                        padding:  EdgeInsets.all(28.0),
                        child:  Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ):      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: darkGrey2,
                          ),
                            InkWell(
                            onTap: () {

                     CartCubit.get(context).addOrder(
                                  note: noteController.text,
                                  address: addressController.text,
                                  list: list);

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
                                          color: Colors.white, fontSize: 12),
                                    ),
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
        },
      ),
    );
  }
}
