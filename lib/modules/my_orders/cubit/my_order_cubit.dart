import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/models/order.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/network/local/cache_helper.dart';
part 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  MyOrderCubit() : super(MyOrderInitial());
  static MyOrderCubit get(context) => BlocProvider.of(context);

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  Order? order;
  getMyOrders() async {
    if (await connectionChecker.hasConnection) {
      print(CacheHelper.getData(key: 'api_token'));

      emit(MyOrderLoading());
      try {
        var myUrl = Uri.parse("$baseUrl/myorder");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
        });

        print(response.statusCode);
        print(response.body);
        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          debugPrint(response.statusCode.toString());
          order = Order.fromJson(data);

          emit(MyOrderSuccess());
        } else if (response.statusCode == 404) {
          emit(MyOrdersEmpty());
        }
      } catch (e) {
        print(e);
        emit(MyOrderError('Error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }
}
