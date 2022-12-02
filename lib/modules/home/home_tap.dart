
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/modules/home/cubit/home_cubit.dart';
import 'package:queen_care/modules/home/widgets/categories_part.dart';
import 'package:queen_care/modules/home/widgets/copon_widget.dart';
import 'package:queen_care/modules/home/widgets/search_bar.dart';

class HomeTap extends StatelessWidget {
  const HomeTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List<Category> categoriesList=[];
    return BlocProvider(
  create: (context) => HomeCubit()..getCategoryWithHttp(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
if(state is GetCategoriesSuccess){
  categoriesList = state.categoriesList;
}
  },
  builder: (context, state) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            searchBar(w: w),
            const  SizedBox(height: 15,),

            coponWidget(h: h, w: w, onTap: (){},),
            const   SizedBox(height: 15,),
            const  Align(
              alignment: Alignment.topRight,
              child: Text('الأقسام',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
            ),
        state is GetCategoriesLoading?const Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,


            color: kPrimaryColor,

          )),
        ):    CategoriesPart(categoriesList: categoriesList,),

          ],
        ),
      ),
    );
  },
),
);
  }
}
