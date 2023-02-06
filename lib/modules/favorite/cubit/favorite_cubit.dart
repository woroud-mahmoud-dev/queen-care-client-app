import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/models/favoriteModel.dart';
import 'package:queen_care/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/cache_helper.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);
  late int id;

  //get all products
  List<FavoriteModel> favoriteList = [];

  getAllFavoriteProductsWithHttp(
      ) async {
    emit(GetFavoriteProductLoading());


    var myUrl = Uri.parse("https://karam-app.com/celo/queencare/public/api/show_favourite");


    final response = await http.post(myUrl ,body: {
    'token':CacheHelper.getData(key: 'api_token'),



    });



    if (response.statusCode == 200) {
      favoriteList = favoriteModelFromJson(response.body);
      print(response.statusCode);
      print(favoriteList.length);
      print(favoriteList);



      emit(GetFavoriteProductSuccess(allProductsList: favoriteList));
    } else if (response.statusCode == 404) {
      emit(GetFavoriteProductError('error'));
    }
  }
  deleteFromFavorite(int id)async{
    print(id);
    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/delete-favourite");

    final response = await http.post(myUrl, body: {
      'id': id.toString(),

    });
    if(response.statusCode ==200){
      emit(DeleteFromFavoriteSuccessState());
    }else{
      emit(DeleteFromFavoriteErrorsState());
    }
  }



}
