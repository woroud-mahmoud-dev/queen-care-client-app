import 'dart:convert';

import 'package:queen_care/models/order_client.dart';
import 'package:queen_care/models/product.dart';
class OrderElement {
  final int id;
  final String userId;
  final String clientId;
  final String deliveryId;
  final String price;
  final String note;
  final String address;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderClient> orderClientList;

  OrderElement({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.deliveryId,
    required this.price,
    required this.note,
    required this.address,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderClientList,
  });

  factory OrderElement.fromJson(Map<String, dynamic> json) => OrderElement(
    id: json["id"],
    userId: json["user_id"]??"",
    clientId: json["client_id"]??"",
    deliveryId: json["delivery_id"]??"",
    price: json["price"] ?? "",
    note: json["note"] ?? "",
    address: json["address"] ?? "",
    state: json["state"] ?? "0",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    orderClientList: List<OrderClient>.from(
        json["order_client"].map((x) => OrderClient.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "client_id": clientId,
    "delivery_id": deliveryId,
    "price": price,
    "note": note,
    "address": address,
    "state": state,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "order_client": List<OrderClient>.from(orderClientList.map((x) => x.toJson())),
  };
}
