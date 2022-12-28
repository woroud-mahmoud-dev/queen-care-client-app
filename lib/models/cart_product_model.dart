
import 'dart:convert';

CartProductModel cartProductModelFromJson(String str) => CartProductModel.fromJson(json.decode(str));

String cartProductModelToJson(CartProductModel data) => json.encode(data.toJson());

class CartProductModel {
  CartProductModel({
    required this.id,
    required this.note,
    required this.address,
    required this.clientId,
  });

  List<Id> id;
  String note;
  String address;
  int clientId;

  factory CartProductModel.fromJson(Map<String, dynamic> json) => CartProductModel(
    id: List<Id>.from(json["id"].map((x) => Id.fromJson(x))),
    note: json["note"],
    address: json["address"],
    clientId: json["client_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": List<dynamic>.from(id.map((x) => x.toJson())),
    "note": note,
    "address": address,
    "client_id": clientId,
  };
}

class Id {
  Id({
    required this.id,
    required this.amount,
    required this.price,
  });

  int id;
  int amount;
  int price;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    id: json["id"],
    amount: json["amount"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "price": price,
  };
}
