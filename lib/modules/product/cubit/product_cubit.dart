import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/chach_helper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  MyService myService = MyService();
  static ProductCubit get(context) => BlocProvider.of(context);
  late int id;

  //get all products
  List<ProductModel> productsList = [];

  getAllProductsWithHttp() async {
    emit(GetAllProductByTypeLoading());

    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/mission");

    final response = await http.get(myUrl);

    if (response.statusCode == 200) {
      productsList = productModelFromJson(response.body);
      print(response.statusCode);
      print(productsList.length);
      print(productsList.length);
      print(productsList.length);
      print(productsList.length);
      print(productsList.length);
      print(productsList.first.name);
      print(productsList.first.description);

      emit(GetAllProductSuccess(allProductsList: productsList));
    } else if (response.statusCode == 404) {
      emit(GetAllProductError('error'));
    }
  }

  //get products orderBy type
  List<ProductModel> productsListByType = [];

  void getAllProductsByTypeWithHttp() async {
    emit(GetAllProductByTypeLoading());
    debugPrint('the id is :${myService.getSelectedCategory!.id.toString()}');

    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/show");

    final response = await http.post(myUrl,
        body: {
      'id': myService.getSelectedCategory!.id.toString(),
          'token':CacheHelper.getData(key: 'api_token'),
    });

    // List<dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {
      productsListByType = productModelFromJson(response.body);
      print(response.statusCode);
      print(productsListByType);
      print(productsListByType.first.name);
      print(productsListByType.first.description);

      emit(GetAllProductByTypeSuccess(productsList: productsListByType));
    } else if (response.statusCode == 404) {
      emit(GetAllProductByTypeError('error'));
    }
  }

  ////////
  int productNumber = 0;
  void increaseProductNumber() {
    if (productNumber >= 0) {
      productNumber = productNumber + 1;

      emit(IncreaseProductNumberState());
    } else {}
  }

  void decreaseProductNumber() {
    if (productNumber == 0) {
    } else {
      productNumber = productNumber - 1;
      emit(IncreaseProductNumberState());
    }
  }

   addToFavorite(int productId) async {
    emit(AddToFavoriteLoadingState());

    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/add_to_favourite");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
      'mission_id': productId.toString()
    });
    print(response.statusCode);
    print(response.body.toString());


    if (response.statusCode == 200) {


      emit(AddToFavoriteSuccessState(message: "تمت الاإضافة بنجاح"));
    } else if (response.statusCode == 404) {
      emit(AddToFavoriteErrorState(error: response.body.toString()));
    }
  }
   addToCart(int productId) async {
    emit(AddToCartLoadingState());

    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/add_to_cart");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
      'mission_id': productId.toString()
    });
    print(response.statusCode);
    print(response.body.toString());


    if (response.statusCode == 200) {


      emit(AddToCartSuccessState(message: "تمت الاإضافة  إلى السلة بنجاح"));
    } else if (response.statusCode == 404) {
      emit(AddToCartErrorState(error: response.body.toString()));
    }
  }
  Color? btColor ;
  deleteFromFavorite(int id)async{
    print(id);
    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/delete-favourite");

    final response = await http.post(myUrl, body: {
      'id': id.toString(),

    });
    print(response.statusCode);
    if(response.statusCode ==200){
      emit(DeleteFromFavoriteSuccessState());
    }else if(response.statusCode ==404){
      emit(DeleteFromFavoriteErrorsState());
    }
  }
}
