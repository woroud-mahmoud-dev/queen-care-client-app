import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'dart:convert';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/cache_helper.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartModel> allCartsProductsList = [];
  MyService myService = MyService();
  int productNumber = 0;
  var allMoney = 0;
  bool refresh = false;
  Map<dynamic, dynamic> priceMap = {};
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  Future<List<CartModel>> getAllCartsProduct() async {
    emit(GetAllProductsLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/show_cart");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
        });

        if (response.statusCode == 200) {
          debugPrint(response.statusCode.toString());
          allCartsProductsList = cartModelFromJson(response.body);

          myService.setNumberOfItems = List.generate(
              allCartsProductsList.length,
              (index) => int.parse(allCartsProductsList[index].amount));
          allCartsProductsList.isNotEmpty
              ? countAllMoney(allCartsProductsList)
              : debugPrint('empty');
          emit(GetAllProductsSuccessState(
              allProductsList: allCartsProductsList));
        } else if (response.statusCode == 404) {
          emit(GetAllProductsErrorState(error: 'error'));
        }
      } catch (e) {
        emit(GetAllProductsErrorState(error: 'error:$e'));
      }
    } else {
      emit(DeviceNotConnectedState());
    }

    return allCartsProductsList;
  }

  Future<void> deleteFromCart(int id) async {
    debugPrint(id.toString());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/delete-cart");

        final response = await http.post(myUrl, body: {
          'id': id.toString(),
        });
        debugPrint(response.statusCode.toString());
        if (response.statusCode == 200) {
          getAllCartsProduct();
          emit(DeleteFromCartSuccessState());
        } else if (response.statusCode == 400) {
          emit(DeleteFromCartErrorsState());
        }
      } catch (e) {
        emit(DeleteFromCartErrorsState());
      }
    } else {
      emit(DeviceNotConnectedToDeleteState());
    }
  }

  Future<void> addOrder({
    required List<Map<String, dynamic>> list,
    required String address,
    required String note,
  }) async {
    emit(AddOrderLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/addorder");
        var body = json.encode({
          'token': CacheHelper.getData(key: 'api_token'),
          'id': list,
          'address':
              address.isEmpty ? CacheHelper.getData(key: 'address') : address,
          'note': note,
          'client_id': '1',
        });
        final response = await http.post(myUrl,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);
        debugPrint(response.statusCode.toString());
        debugPrint(response.body.toString());
        if (response.statusCode == 200) {
          emit(AddOrderSuccessState());
        } else if (response.statusCode == 404) {
          emit(AddOrderErrorState());
        }
      } catch (e) {
        emit(AddOrderErrorState());
      }
    } else {
      emit(DeviceNotConnectedToSendOrderState());
    }
  }

  void increaseProductNumber(int productId) {
    debugPrint(
        'numberOfItems[productId] is :${myService.getNumberOfItems![productId]}');
    if (myService.getNumberOfItems![productId] >= 0) {
      myService.getNumberOfItems![productId]++;

      emit(IncreaseProductNumberState(allMoney: 0000));
    } else {}
  }

  void decreaseProductNumber(int productId) {
    if (myService.getNumberOfItems![productId] == 0) {
    } else {
      myService.getNumberOfItems![productId]--;
      debugPrint(myService.getNumberOfItems![productId].toString());

      emit(DecreaseProductNumberState(allMoney: 999));
    }
  }

  dynamic countAllMoney(List<CartModel> allCartsProductsList) {
    List<dynamic> items = List.generate(
        myService.getNumberOfItems!.length,
        (index) =>
            myService.getNumberOfItems![index] *
            int.parse(allCartsProductsList[index].mission.price));
    debugPrint(items.toString());

    return allMoney = items.reduce((a, b) => a + b);
  }
}
