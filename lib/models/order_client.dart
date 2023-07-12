class OrderClient {
  final int id;
  final String userId;
  final String clientId;
  final String orderId;
  final String missionId;
  final String deliveryId;
  final String price;
  final String amount;
  final String qrId;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderClient({
    required this.id,
    required this.userId,
    required this.clientId,
    required this.orderId,
    required this.missionId,
    required  this.deliveryId,
    required this.price,
    required this.amount,
    required    this.qrId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderClient.fromJson(Map<String, dynamic> json) => OrderClient(
    id: json["id"]??"",
    userId: json["user_id"]??"",
    clientId: json["client_id"]??"",
    orderId: json["order_id"]??"",
    missionId: json["mission_id"]??"",
    deliveryId: json["delivery_id"]??"",
    price: json["price"] ?? "",
    amount: json["amount"] ?? "",
    qrId: json["qr_id"] ?? "",
    state: json["state"] ?? "0",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "client_id": clientId,
    "order_id": orderId,
    "mission_id": missionId,
    "delivery_id": deliveryId,
    "price": price,
    "amount": amount,
    "qr_id": qrId,
    "state": state,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
