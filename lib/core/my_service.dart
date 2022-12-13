
import 'package:queen_care/models/category.dart';
import 'package:queen_care/models/product.dart';

class MyService {
  static CategoryModel? selectedCategory;

  static ProductModel? selectedProduct;
  static DateTime? lastDateTime;
  static int?daysNumber;
  static int?howLongPeriod;


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
}