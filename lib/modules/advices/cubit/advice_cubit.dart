import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:queen_care/models/blog_model.dart';
import 'package:queen_care/models/cat_blog_model.dart';
import 'package:http/http.dart' as http;

part 'advice_state.dart';

class AdviceCubit extends Cubit<AdviceState> {
  AdviceCubit() : super(AdviceInitial());
  static AdviceCubit get(context) => BlocProvider.of(context);

  List<CategoryBlogModel> categories_list = [
    CategoryBlogModel(id: 0,name: 'الكل'),
  ];
  List<BlogModel> blogsList = [];

  getCategoryWithHttp() async {
    emit(GetCategoriesLoading());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/cat-blog");

    final response = await http.get(myUrl);

    // List<dynamic> data = json.decode(response.body);

    if (response.statusCode == 200) {

      categories_list.addAll( categoryBlogModelFromJson(response.body));

      emit(GetCategoriesSuccess(categoriesList: categories_list));
    } else if (response.statusCode == 404) {
      emit(GetCategoriesError('Error'));
    }
  }

  getBlogByIdWithHttp(int id) async {
    emit(GetBlogsLoading());
    var myUrl =
        Uri.parse("https://karam-app.com/celo/queencare/public/api/show_blog");

    final response = await http.post(myUrl, body: {
      'id': id.toString(),
    });


    if (response.statusCode == 200) {
      blogsList = blogModelFromJson(response.body);  emit(GetBlogsSuccess(blogsList: blogsList));


    } else if (response.statusCode == 404) {
      emit(GetBlogsError('Error'));
    }
  }
}
