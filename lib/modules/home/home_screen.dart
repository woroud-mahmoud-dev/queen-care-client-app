import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategoryWithHttp(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return Scaffold(


            bottomNavigationBar: Container(

              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  // bottomRight: Radius.circular(20),
                  // bottomLeft: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
                child: BottomNavigationBar(

                  backgroundColor: Colors.white,
                  unselectedItemColor: darkGrey,
                  selectedItemColor: kPrimaryColor,
                  type: BottomNavigationBarType.fixed,

                  items: HomeCubit.get(context).bottom_nav_items,
                  currentIndex: HomeCubit.get(context).current_index,
                  onTap: (index){
                    HomeCubit.get(context).change_nav_index(index);
                  },

                ),
              ),
            ),
            body: HomeCubit.get(context).screens[HomeCubit.get(context).current_index],
          );
        },
      ),
    );
  }
}
