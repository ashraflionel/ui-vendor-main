// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.storeInfo,
        required this.success,
    });

    StoreInfo storeInfo;
    Success success;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        storeInfo: StoreInfo.fromJson(json["store_info"]),
        success: Success.fromJson(json["success"]),
    );

    Map<String, dynamic> toJson() => {
        "store_info": storeInfo.toJson(),
        "success": success.toJson(),
    };
}

class StoreInfo {
    StoreInfo({
        required this.secretKey,
        required this.storeId,
        required this.name,
        required this.owner,
        required this.email,
        required this.telephone,
        required this.storeType,
        required this.storeGroupId,
    });

    String secretKey;
    String storeId;
    String name;
    String owner;
    String email;
    String telephone;
    String storeType;
    String storeGroupId;

    factory StoreInfo.fromJson(Map<String, dynamic> json) => StoreInfo(
        secretKey: json["secret_key"],
        storeId: json["store_id"],
        name: json["name"],
        owner: json["owner"],
        email: json["email"],
        telephone: json["telephone"],
        storeType: json["store_type"],
        storeGroupId: json["store_group_id"],
    );

    Map<String, dynamic> toJson() => {
        "secret_key": secretKey,
        "store_id": storeId,
        "name": name,
        "owner": owner,
        "email": email,
        "telephone": telephone,
        "store_type": storeType,
        "store_group_id": storeGroupId,
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
