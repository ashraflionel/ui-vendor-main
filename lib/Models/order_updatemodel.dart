// To parse this JSON data, do
//
//     final orderUpdateModel = orderUpdateModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderUpdateModel orderUpdateModelFromJson(String str) => OrderUpdateModel.fromJson(json.decode(str));

String orderUpdateModelToJson(OrderUpdateModel data) => json.encode(data.toJson());

class OrderUpdateModel {
    OrderUpdateModel({
        required this.success,
    });

    Success success;

    factory OrderUpdateModel.fromJson(Map<String, dynamic> json) => OrderUpdateModel(
        success: Success.fromJson(json["success"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success.toJson(),
    };
}

class Success {
    Success({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory Success.fromJson(Map<String, dynamic> json) => Success(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
