import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/app_localization.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/constant.dart';
import 'package:queen_care/core/widget/error_snack_bar.dart';
import 'package:queen_care/core/widget/logo_image.dart';
import 'package:queen_care/core/widget/no_internet_snackBar.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:queen_care/modules/cart/cubit/cart_cubit.dart';
import 'package:queen_care/modules/cart/order_done.dart';
import 'package:queen_care/modules/cart/widgets/send_order_card.dart';
import 'package:queen_care/modules/cart/widgets/show_products_part.dart';
import 'package:queen_care/network/local/cache_helper.dart';

class CompleteBuyScreen extends StatelessWidget {
  CompleteBuyScreen({
    Key? key,
    required this.allProducts,
  }) : super(key: key);
  final addressController = TextEditingController();
  final noteController = TextEditingController();
  final List<CartModel> allProducts;
  final myService = MyService();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubit()..countAllMoney(allProducts),
        child: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is AddOrderSuccessState) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderDone()),
                  (route) => false);
            } else if (state is AddOrderErrorState) {
              showErrorSnackBar(context);
            }
            if (state is DeviceNotConnectedToSendOrderState) {
              showSnackBar(context);
            }
          },
          builder: (context, state) {
            int allMoney = 0;
            allMoney = CartCubit.get(context).allMoney;
            List<Map<String, dynamic>> list =
                List.generate(allProducts.length, (index) {
              return {
                'amount': myService.getNumberOfItems![index],
                'price': allProducts[index].mission.price,
                'id': allProducts[index].missionId,
              };
            });
            return Container(
              decoration: customBoxDecoration,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BackButton(),
                       Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'complete_purchases'.tr(context),
                          style:const TextStyle(color: kPrimaryColor, fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.2,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      LogoImage(
                        w: w * 0.22,
                        h: h * 0.11,
                      ),
                    ],
                  ),
                   Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:const EdgeInsets.all(20),
                      child: Text(
                        'purchases'.tr(context),
                        style: const TextStyle(color: kPrimaryColor, fontSize: 16),
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
                    height: h * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Text(
                          'address'.tr(context),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'edite_address'.tr(context),
                          style:const TextStyle(
                            color: darkGrey,
                            fontSize: 14,
                          ),
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
                      children:  [
                        Text(
                          'add_notes'.tr(context),
                          style:const TextStyle(
                            color: darkGrey,
                            fontSize: 14,
                          ),
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
                          decoration:  InputDecoration(
                            hintText:  'add_notes'.tr(context),
                            prefixIconColor: kPrimaryColor,


                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: kPrimaryColor),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  SendOrderCard(
                      state: state,
                      allMoney: allMoney,
                      noteController: noteController,
                      addressController: addressController,
                      list: list,
                      w: w,
                      h: h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
