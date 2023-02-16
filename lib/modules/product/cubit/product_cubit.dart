import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/cache_helper.dart';
import 'package:queen_care/network/remote/http_helper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  MyService myService = MyService();
  static ProductCubit get(context) => BlocProvider.of(context);
  late int id;
  Color? btColor;
  int productNumber = 0;
  List<ProductModel> productsListByType = [];

  List<ProductModel> productsList = [];
  final apiBaseHelper = ApiBaseHelper();

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  getAllProductsWithHttp() async {
    emit(GetAllProductByTypeLoading());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/mission");

        final response = await http.get(myUrl);

        if (response.statusCode == 200) {
          productsList = productModelFromJson(response.body);

          emit(GetAllProductSuccess(allProductsList: productsList));
        }
      } catch (e) {
        emit(GetAllProductError('Error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }

  void getAllProductsByTypeWithHttp() async {
    emit(GetAllProductByTypeLoading());
    if (await connectionChecker.hasConnection) {
      try {
        debugPrint(
            'the id is :${myService.getSelectedCategory!.id.toString()}');

        var myUrl =
            Uri.parse("https://karam-app.com/celo/queencare/public/api/show");

        final response = await http.post(myUrl, body: {
          'id': myService.getSelectedCategory!.id.toString(),
          'token': CacheHelper.getData(key: 'api_token'),
        });

        // List<dynamic> data = json.decode(response.body);

        if (response.statusCode == 200) {
          productsListByType = productModelFromJson(response.body);
          if (productsListByType.isEmpty) {
            emit(Empty());
          }
          debugPrint(response.statusCode.toString());
          debugPrint(productsListByType.toString());
          debugPrint(productsListByType.first.name);
          debugPrint(productsListByType.first.description);

          emit(GetAllProductByTypeSuccess(productsList: productsListByType));
        } else if (response.statusCode == 404) {
          // emit(GetAllProductByTypeError('error'));
        }
      } catch (e) {
        // emit(GetAllProductByTypeError('error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }

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

  // addToFavorite(int productId) async {
  //   emit(AddToFavoriteLoadingState());
  //
  //   var myUrl = Uri.parse(
  //       "https://karam-app.com/celo/queencare/public/api/add_to_favourite");
  //
  //   final response = await http.post(myUrl, body: {
  //     'token': CacheHelper.getData(key: 'api_token'),
  //     'mission_id': productId.toString()
  //   });
  //   debugPrint(response.statusCode.toString());
  //   debugPrint(response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     emit(AddToFavoriteSuccessState(message: "تمت الاإضافة بنجاح"));
  //   } else if (response.statusCode == 404) {
  //     emit(AddToFavoriteErrorState(error: response.body.toString()));
  //   }
  // }

  addToCart({required int productId, required int amount}) async {
    emit(AddToCartLoadingState());

    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/add_to_cart");

    final response = await http.post(myUrl, body: {
      'token': CacheHelper.getData(key: 'api_token'),
      'mission_id': productId.toString(),
      'amount': amount.toString(),
    });
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString());

    if (response.statusCode == 200) {
      emit(AddToCartSuccessState(message: "تمت الاإضافة  إلى السلة بنجاح"));
    } else if (response.statusCode == 404) {
      emit(AddToCartErrorState(error: response.body.toString()));
    }
  }

  addToFavorite(int productId) async {
    if (await connectionChecker.hasConnection) {
      try {
        await apiBaseHelper.post('add_to_favourite', {
          'token': CacheHelper.getData(key: 'api_token'),
          'mission_id': productId.toString()
        });
        CacheHelper.saveData(key: 'isFav', value: true);
        emit(AddToFavoriteSuccessState(message: "تمت الاإضافة بنجاح"));
      } catch (e) {
        debugPrint(e.toString());
        emit(AddToFavoriteErrorState(error: e.toString()));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }

  deleteFromFavorite(int id) async {
    if (await connectionChecker.hasConnection) {
      try {
        await apiBaseHelper.post('delete-favourite', {
          'id': id.toString(),
        });
        CacheHelper.saveData(key: 'isFav', value: false);
        emit(DeleteFromFavoriteSuccessState());
      } catch (e) {
        debugPrint(e.toString());
        emit(DeleteFromFavoriteErrorsState());
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }
}
