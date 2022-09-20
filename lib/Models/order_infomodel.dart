// To parse this JSON data, do
//
//     final orderInfoModel = orderInfoModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderInfoModel orderInfoModelFromJson(String str) => OrderInfoModel.fromJson(json.decode(str));

String orderInfoModelToJson(OrderInfoModel data) => json.encode(data.toJson());

class OrderInfoModel {
  OrderInfoModel({
    required this.orderId,
    required this.info,
    required this.orderStatusId,
    required this.success,
  });

  String orderId;
  Info info;
  String orderStatusId;
  Success success;

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) => OrderInfoModel(
        orderId: json["order_id"],
        info: Info.fromJson(json["info"]),
        orderStatusId: json["order_status_id"],
        success: Success.fromJson(json["success"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "info": info.toJson(),
        "order_status_id": orderStatusId,
        "success": success.toJson(),
      };
}

class Info {
  Info({
    required this.customerId,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.telephone,
    required this.houseNumber,
    required this.vendor,
    required this.invoiceNo,
    required this.dateAdded,
    required this.total,
    required this.status,
    required this.deliveryType,
    required this.orderType,
    required this.orderTypeId,
    required this.deliveryTime,
    required this.restaurantDelivery,
    required this.paymentAddress,
    required this.paymentMethod,
    required this.shippingAddress,
    required this.shippingMethod,
    required this.comment,
    required this.driverInfo,
    required this.images,
    required this.products,
    required this.totals,
    required this.histories,
  });

  String customerId;
  String firstname;
  String lastname;
  String email;
  String telephone;
  String houseNumber;
  Vendor vendor;
  String invoiceNo;
  String dateAdded;
  String total;
  String status;
  String deliveryType;
  String orderType;
  String orderTypeId;
  String deliveryTime;
  int restaurantDelivery;
  String paymentAddress;
  String paymentMethod;
  String shippingAddress;
  String shippingMethod;
  String comment;
  List<DriverInfo> driverInfo;
  List<Image> images;
  List<Product> products;
  List<Total> totals;
  List<History> histories;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        customerId: json["customer_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        houseNumber: json["house_number"],
        vendor: Vendor.fromJson(json["vendor"]),
        invoiceNo: json["invoice_no"],
        dateAdded: json["date_added"],
        total: json["total"],
        status: json["status"],
        deliveryType: json["delivery_type"],
        orderType: json["order_type"],
        orderTypeId: json["order_type_id"],
        deliveryTime: json["delivery_time"],
        restaurantDelivery: json["restaurant_delivery"],
        paymentAddress: json["payment_address"],
        paymentMethod: json["payment_method"],
        shippingAddress: json["shipping_address"],
        shippingMethod: json["shipping_method"],
        comment: json["comment"],
        driverInfo: List<DriverInfo>.from(json["driver_info"].map((x) => DriverInfo.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        totals: List<Total>.from(json["totals"].map((x) => Total.fromJson(x))),
        histories: List<History>.from(json["histories"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "house_number": houseNumber,
        "vendor": vendor.toJson(),
        "invoice_no": invoiceNo,
        "date_added": dateAdded,
        "total": total,
        "status": status,
        "delivery_type": deliveryType,
        "order_type": orderType,
        "order_type_id": orderTypeId,
        "delivery_time": deliveryTime,
        "restaurant_delivery": restaurantDelivery,
        "payment_address": paymentAddress,
        "payment_method": paymentMethod,
        "shipping_address": shippingAddress,
        "shipping_method": shippingMethod,
        "comment": comment,
        "driver_info": List<dynamic>.from(driverInfo.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "totals": List<dynamic>.from(totals.map((x) => x.toJson())),
        "histories": List<dynamic>.from(histories.map((x) => x.toJson())),
      };
}

class DriverInfo {
  DriverInfo({
    required this.driverId,
    required this.name,
  });

  String driverId;
  String name;

  factory DriverInfo.fromJson(Map<String, dynamic> json) => DriverInfo(
        driverId: json["driver_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "driver_id": driverId,
        "name": name,
      };
}

class History {
  History({
    required this.dateAdded,
    required this.status,
    required this.comment,
  });

  String dateAdded;
  String status;
  String comment;

  factory History.fromJson(Map<String, dynamic> json) => History(
        dateAdded: json["date_added"],
        status: json["status"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "date_added": dateAdded,
        "status": status,
        "comment": comment,
      };
}

class Image {
  Image({
    required this.imageId,
    required this.image,
  });

  String imageId;
  String image;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageId: json["image_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "image": image,
      };
}

class Product {
  Product({
    required this.name,
    required this.image,
    required this.model,
    required this.option,
    required this.quantity,
    required this.price,
    required this.total,
  });

  String name;
  String image;
  String model;
  List<dynamic> option;
  String quantity;
  String price;
  String total;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        image: json["image"],
        model: json["model"],
        option: List<dynamic>.from(json["option"].map((x) => x)),
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "model": model,
        "option": List<dynamic>.from(option.map((x) => x)),
        "quantity": quantity,
        "price": price,
        "total": total,
      };
}

class Total {
  Total({
    required this.title,
    required this.text,
  });

  String title;
  String text;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        title: json["title"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "text": text,
      };
}

class Vendor {
  Vendor({
    required this.storeId,
    required this.name,
    required this.address,
    required this.email,
    required this.telephone,
    required this.logo,
  });

  String storeId;
  String name;
  String address;
  String email;
  String telephone;
  String logo;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        storeId: json["store_id"],
        name: json["name"],
        address: json["address"],
        email: json["email"],
        telephone: json["telephone"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "name": name,
        "address": address,
        "email": email,
        "telephone": telephone,
        "logo": logo,
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
