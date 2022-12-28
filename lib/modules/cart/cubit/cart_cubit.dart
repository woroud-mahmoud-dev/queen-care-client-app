import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/models/cart_product_model.dart';
import 'package:queen_care/network/local/chach_helper.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> allCartsProductsList = [];
  MyService myService =MyService();
  int productNumber =0;
var allMoney=0 ;

  Map<dynamic,dynamic>priceMap={};
  Future<List<CartModel>> getAllCartsProduct(
      ) async {
    emit(GetAllProductsLoadingState());
    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/show_cart");


    final response = await http.post(myUrl,
    body: {
      'token':CacheHelper.getData(key: 'api_token'),
    }
    );



    if (response.statusCode == 200) {

      print(response.statusCode);
      allCartsProductsList = cartModelFromJson(response.body);

      myService.setNumberOfItems=List.generate(allCartsProductsList.length, (index) => 0);

      emit(GetAllProductsSuccessState(allProductsList: allCartsProductsList));

    } else if (response.statusCode == 404) {
      emit(GetAllProductsErrorState(error: 'error'));
    }
    return allCartsProductsList;
  }

  deleteFromCart(int id)async{
    print(id);
    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/delete-cart");

    final response = await http.post(myUrl, body: {
      'id': id.toString(),

    });
    print(response.statusCode);
    if(response.statusCode ==200){
      emit(DeleteFromCartSuccessState());
    }else if(response.statusCode ==400){
      emit(DeleteFromCartErrorsState());
    }
  }
  void increaseProductNumber(int productId) {
    print('numberOfItems[productId] is :${myService.getNumberOfItems![productId] }');
    if ( myService.getNumberOfItems![productId] >= 0) {
      myService.getNumberOfItems![productId] ++;


      emit(IncreaseProductNumberState(
        allMoney: 0000
      ));
    } else {}
  }

  void decreaseProductNumber(int productId) {
    if ( myService.getNumberOfItems![productId] == 0) {
    } else {
      myService.getNumberOfItems![productId]--;
      print(myService.getNumberOfItems![productId]);



      emit(DecreaseProductNumberState(
        allMoney: 999
      ));
    }
  }
  int countAllMoney(){
    for(int i=0;i<myService.getNumberOfItems!.length;i++){
      allMoney = i*int.parse(allCartsProductsList[i].mission.price);
      return allMoney;
    }
  return  allMoney;

  }
}
class AmountModel {
  int id;
  int price;
  int amount;

  AmountModel({required this.id, required this.price, required this.amount,
  });
}