import 'package:flutter/material.dart';
import 'package:queen_care/models/blog_model.dart';
import 'package:queen_care/models/category.dart';
import 'package:queen_care/models/competition.dart';
import 'package:queen_care/models/product.dart';

class MyService {
  static CategoryModel? selectedCategory;

  static ProductModel? selectedProduct;
  static DateTime lastDateTime = DateTime.now();
  static DateTime? birthDateTime;
  static int? daysNumber;
  static int? howLongPeriod;
  static bool? showNotToAdd;
  static Competition? selectedComp;
  static BlogModel? selectedBlog;
  static Color? productColor;
  static List<int>? numberOfItems;
  set setSelectedCategory(CategoryModel category) {
    selectedCategory = category;
  }

  CategoryModel? get getSelectedCategory {
    return selectedCategory;
  }

  set setSelectedProduct(ProductModel productModel) {
    selectedProduct = productModel;
  }

  ProductModel? get getSelectedProduct {
    return selectedProduct;
  }

  set setLastDate(DateTime dateTime) {
    lastDateTime = dateTime;
  }

  DateTime? get getLastDate {
    return lastDateTime;
  }

  set setBirthDate(DateTime dateTime) {
    birthDateTime = dateTime;
  }

  DateTime? get getBirthDate {
    return birthDateTime;
  }

  set setDaysNumber(int number) {
    daysNumber = number;
  }

  int? get getDaysNumber {
    return daysNumber;
  }

  set setHowLongPeriod(int number) {
    howLongPeriod = number;
  }

  int? get getHowLongPeriod {
    return howLongPeriod;
  }

  set setShowNotToAdd(bool number) {
    showNotToAdd = number;
  }

  bool? get getShowNotToAdd {
    return showNotToAdd;
  }

  set setSelectedComp(Competition competition) {
    selectedComp = competition;
  }

  Competition? get getSelectedComp {
    return selectedComp;
  }

  set setSelectedBlog(BlogModel blogModel) {
    selectedBlog = blogModel;
  }

  BlogModel? get getSelectedBlog {
    return selectedBlog;
  }

  set setColor(Color color) {
    productColor = color;
  }

  Color? get getColor {
    return productColor;
  }

  set setNumberOfItems(List<int> list) {
    numberOfItems = list;
  }

  List<int>? get getNumberOfItems {
    return numberOfItems;
  }
}
