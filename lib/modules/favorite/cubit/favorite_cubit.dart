import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/models/favoriteModel.dart';
import 'package:http/http.dart' as http;
import 'package:queen_care/network/local/cache_helper.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  List<FavoriteModel> favoriteList = [];

  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  getAllFavoriteProductsWithHttp() async {
    emit(GetFavoriteProductLoading());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "https://karam-app.com/celo/queencare/public/api/show_favourite");

        final response = await http.post(myUrl, body: {
          'token': CacheHelper.getData(key: 'api_token'),
        });

        if (response.statusCode == 200) {
          favoriteList = favoriteModelFromJson(response.body);

          emit(GetFavoriteProductSuccess(allProductsList: favoriteList));
        }
      } catch (e) {
        emit(GetFavoriteProductError('error'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }

  deleteFromFavorite(int id) async {
    var myUrl = Uri.parse(
        "https://karam-app.com/celo/queencare/public/api/delete-favourite");

    final response = await http.post(myUrl, body: {
      'id': id.toString(),
    });
    if (response.statusCode == 200) {
      emit(DeleteFromFavoriteSuccessState());
    } else {
      emit(DeleteFromFavoriteErrorsState());
    }
  }
}
