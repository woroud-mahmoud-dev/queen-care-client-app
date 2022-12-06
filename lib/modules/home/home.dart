import 'package:flutter/material.dart';
import 'package:queen_care/core/utlis/constant.dart';
import 'package:queen_care/modules/auth/pages/profile/profile.dart';
import 'package:queen_care/modules/home/favorite_tap.dart';
import 'package:queen_care/modules/home/home_tap.dart';
import 'package:queen_care/modules/home/offers_tap.dart';
import 'package:queen_care/modules/period_calculator/period_calculator.dart';
import 'package:queen_care/modules/period_calculator/peroid_qustions.dart';
import 'package:queen_care/modules/product/category_all_products.dart';
import 'package:queen_care/modules/product/product_detailes.dart';

import '../product/prouct_screen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {


  int _currentIndexBottomNavigationBarItem = 3;




  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: 9,
        vsync: this,
        initialIndex: 0,
        animationDuration: const Duration(seconds: 0));
    tabController.addListener(handleTabSelection);
  }

  void handleTabSelection() {
    setState(() {
      if (tabController.index < 4) {

        _currentIndexBottomNavigationBarItem = tabController.index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: <Widget>[
          HomeTap(tabController: tabController,),
          Offer(),
          Favorite(),


          Profile(tabController: tabController),
          CategoryAllProducts(tabController: tabController),
          ProductScreen(tabController: tabController),
          ProductDetails(tabController: tabController),
          PeriodQuestions(tabController: tabController,),
          PeriodCalculator(),


        ],
      ),

      bottomNavigationBar: Container(  decoration: const BoxDecoration(
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
            unselectedFontSize: 11,
            selectedFontSize: 12,

            items: const [

              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
                  label: 'الرئيسية'),


              BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined),
                  label: 'العروض'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border),
                  label: 'المفضلة'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined),
                  label: 'الحساب '),
            ],
            onTap: onTapedBottomsNavigationBarItem,
            backgroundColor: Colors.white,
            unselectedItemColor: darkGrey,
            selectedItemColor: kPrimaryColor,
            type: BottomNavigationBarType.fixed,

        ),
      )),
    );
  }

  void onTapedBottomsNavigationBarItem(int value) {


    setState(() {
      // _currentIndexBottomNavigationBarItem = value;
      tabController.animateTo(value);
    });
  }



}
