import 'dart:convert';

import 'package:queen_care/models/order_element.dart';
import 'package:queen_care/models/product.dart';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
  final List<OrderElement> order;
  final List<ProductModel> mission;

  Order({
    required this.order,
    required this.mission,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        order: List<OrderElement>.from(
            json["order"].map((x) => OrderElement.fromJson(x))),
        mission: List<ProductModel>.from(
            json["mission"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order": List<OrderElement>.from(order.map((x) => x.toJson())),
        "mission": List<OrderElement>.from(mission.map((x) => x.toJson())),
      };
}
