
// To parse this JSON data, do
//
//     final logincheck = logincheckFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// Logincheck logincheckFromJson(String str) => Logincheck.fromJson(json.decode(str));

// String logincheckToJson(Logincheck data) => json.encode(data.toJson());

// class Logincheck {
//     Logincheck({
//         required this.success,
//     });

//     Success success;

//     factory Logincheck.fromJson(Map<String, dynamic> json) => Logincheck(
//         success: Success.fromJson(json["success"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success.toJson(),
//     };
// }

// class Success {
//     Success({
//         required this.status,
//         required this.message,
//     });

//     String status;
//     String message;

//     factory Success.fromJson(Map<String, dynamic> json) => Success(
//         status: json["status"],
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//     };
// }



//Login Error Model

import 'package:meta/meta.dart';
import 'dart:convert';

Logincheck logincheckFromJson(String str) => Logincheck.fromJson(json.decode(str));
String logincheckToJson(Logincheck data) => json.encode(data.toJson());

class Logincheck {
    Logincheck({
      required this.error,
    });

    Error error;
    factory Logincheck.fromJson(Map<String, dynamic> json) => Logincheck(error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
      "error": error.toJson(),
    };
}

class Error {
    Error({
        required this.status,
        required this.message,
    });

    String status;
    String message;

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
