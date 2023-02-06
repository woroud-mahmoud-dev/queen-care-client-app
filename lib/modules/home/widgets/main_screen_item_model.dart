
import 'package:flutter/material.dart';

class MainScreenItemModel {
  final String title;
  final IconData iconName;
  final int id;
  final int tapId;
  MainScreenItemModel(
      {required this.title,
        required this.id,
        required this.iconName,
        required this.tapId});
}
