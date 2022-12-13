import 'package:flutter/material.dart';

class Category extends InheritedWidget {
  final int id;
  final String categoryName;
  Category({ required this.id,required super.child,required this.categoryName}) : super();
  static Category of(BuildContext context) {
    final Category? result = context.dependOnInheritedWidgetOfExactType<Category>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }
  @override
  bool updateShouldNotify(Category old) => categoryName != old.categoryName;
  bool updateIdShouldNotify(Category old) => id != old.id;

} 