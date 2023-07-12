import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/my_service.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/category.dart';
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
  var controller = TextEditingController(text: '0');
  void increaseProductNumber() {
    if (int.parse(controller.text) >= 0) {
      controller.text = (int.parse(controller.text) + 1).toString();

      emit(IncreaseProductNumberState());
    } else {}
  }
  // void increaseProductNumber() {
  //   if (productNumber >= 0) {
  //     productNumber=productNumber + 1;
  //
  //     emit(IncreaseProductNumberState());
  //   } else {}
  // }

  void decreaseProductNumber() {
    if (int.parse(controller.text) == 0) {
    } else {
      controller.text = (int.parse(controller.text) - 1).toString();
      emit(IncreaseProductNumberState());
    }
  }
  // void decreaseProductNumber() {
  //   if (productNumber == 0) {
  //   } else {
  //     productNumber = productNumber - 1;
  //     emit(IncreaseProductNumberState());
  //   }
  // }

  Future<void> getAllProductsWithHttp() async {
    emit(GetAllProductByTypeLoading());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/mission");

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
      return;
    }
  }

  Future<void> getAllProductsByTypeWithHttp() async {
    emit(GetAllProductByTypeLoading());
    if (await connectionChecker.hasConnection) {
      try {
        debugPrint(
            'the id is :${myService.getSelectedCategory!.id.toString()}');

        var myUrl = Uri.parse("$baseUrl/show");

        final response = await http.post(myUrl, body: {
          'id': myService.getSelectedCategory!.id.toString(),
          'token': CacheHelper.getData(key: 'api_token'),
        });

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
          emit(GetAllProductByTypeError('error'));
        }
      } catch (e) {
        emit(GetAllProductByTypeError('error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return;
    }
  }

  Future<void> addToCart(
      {required int productId, required String amount}) async {
    print(amount);
    emit(AddToCartLoadingState());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse("$baseUrl/add_to_cart");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
          'mission_id': productId.toString(),
          'amount': amount,
        });
        debugPrint(response.statusCode.toString());
        debugPrint(response.body.toString());

        if (response.statusCode == 200) {
          emit(AddToCartSuccessState(message: "تمت الاإضافة  إلى السلة بنجاح"));
        } else if (response.statusCode == 404) {
          emit(AddToCartErrorState(error: response.body.toString()));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(AddToCartErrorState(error: ''));
      }
    } else {
      emit(DeviceNotConnectedState());
      return;
    }
  }

  Future<void> addToFavorite(int productId) async {
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
      return;
    }
  }

  Future<void> deleteFromFavorite(int id) async {
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
      return;
    }
  }
  void setZero() {
    controller.text = "0";
    emit(Update());
  }
  void update() {
    controller.clear();
    emit(Update());
  }

}
