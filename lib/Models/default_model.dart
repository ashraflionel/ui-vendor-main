// To parse this JSON data, do
//
//     final default = defaultFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Default defaultFromJson(String str) => Default.fromJson(json.decode(str));

String defaultToJson(Default data) => json.encode(data.toJson());

class Default {
  Default({
    required this.success,
  });

  Success success;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
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
