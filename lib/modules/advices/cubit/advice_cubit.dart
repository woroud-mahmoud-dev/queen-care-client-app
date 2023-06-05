import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:queen_care/core/utils/strings.dart';
import 'package:queen_care/models/blog_model.dart';
import 'package:queen_care/models/cat_blog_model.dart';
import 'package:http/http.dart' as http;

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceInitial());
  static AdviceCubit get(context) => BlocProvider.of(context);

  List<CategoryBlogModel> categoriesList = [
    CategoryBlogModel(id: 0, name: 'الكل'),
  ];
  List<BlogModel> blogsList = [];
  final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();
  getCategoryWithHttp() async {
    emit(GetCategoriesLoading());

    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "$baseUrl/cat-blog");

        final response = await http.get(myUrl);

        if (response.statusCode == 200) {
          categoriesList.addAll(categoryBlogModelFromJson(response.body));

          emit(GetCategoriesSuccess(categoriesList: categoriesList));
        } else if (response.statusCode == 404) {
          emit(GetCategoriesError('Error'));
        }
      } catch (e) {
        emit(GetCategoriesError('Error: $e'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }

  getBlogByIdWithHttp(int id) async {
    emit(GetBlogsLoading());
    if (await connectionChecker.hasConnection) {
      try {
        var myUrl = Uri.parse(
            "$baseUrl/show_blog");

        final response = await http.post(myUrl, body: {
          'id': id.toString(),
        });

        if (response.statusCode == 200) {
          blogsList = blogModelFromJson(response.body);
          emit(GetBlogsSuccess(blogsList: blogsList));
        } else if (response.statusCode == 404) {
          emit(GetBlogsError('Error'));
        }
      } catch (e) {
        emit(GetBlogsError('Error: $e'));
      }
    } else {
      emit(DeviceNotConnectedState());
      return null;
    }
  }
}
