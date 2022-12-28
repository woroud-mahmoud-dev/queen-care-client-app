
import 'package:flutter/material.dart';
import 'package:queen_care/models/blog_model.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/models/competion.dart';
import 'package:queen_care/models/product.dart';

class MyService {
  static CategoryModel? selectedCategory;

  static ProductModel? selectedProduct;
  static DateTime? lastDateTime;
  static int?daysNumber;
  static int?howLongPeriod;
  static bool? showNotToAdd;
  static Comptition? selectedComp;
  static BlogModel? selectedBlog;
  static Color? productColor;
  static List<int>? numberOfItems;

  set setSelectedCategory(CategoryModel category) {
    selectedCategory = category;
  }

  CategoryModel? get getSelectedCategory {
    return selectedCategory;
  }
 set setSelectedProduct(ProductModel productModel){
    selectedProduct = productModel;
 }
  ProductModel ? get getSelectedProduct{
    return selectedProduct;

  }

/////////
  set setLastDate(DateTime dateTime){
    lastDateTime = dateTime;
  }
  DateTime ? get getLastDate{
    return lastDateTime;

  }
  ////////
  set setDaysNumber(int number){
    daysNumber = number;
  }
  int ? get getDaysNumber{
    return daysNumber;

  }
  //////
  set setHowLongPeriod(int number){
    howLongPeriod = number;
  }
  int ? get getHowLongPeriod{
    return howLongPeriod;

  }
  set setShowNotToAdd(bool number){
    showNotToAdd = number;
  }
  bool ? get getShowNotToAdd{
    return showNotToAdd;

  }
  //
  set setSelectedComp(Comptition comptition){
    selectedComp = comptition;
  }
  Comptition ? get getSelectedComp{
    return selectedComp;

  }
  //
  set setSelectedBlog(BlogModel blogModel){
    selectedBlog = blogModel;
  }
  BlogModel ? get getSelectedBlog{
    return selectedBlog;

  }
 set  setColor(Color color){
   productColor =color;
 }
 Color? get getColor{
    return productColor;
 }
  set  setNumberOfItems(List<int> list){
    numberOfItems =list;
  }
  List<int>? get getNumberOfItems{
    return numberOfItems;
  }
}