// To parse this JSON data, do
//
//     final homeDashboardModel = homeDashboardModelFromJson(jsonString);

import 'dart:convert';

HomeDashboardModel homeDashboardModelFromJson(String str) => HomeDashboardModel.fromJson(json.decode(str));

String homeDashboardModelToJson(HomeDashboardModel data) => json.encode(data.toJson());

class HomeDashboardModel {
    HomeDashboardModel({
        required this.total,
        required this.orders,
        required this.totalOrderProducts,
        required this.totalOrderAmount,
        required this.todayTotal,
       required  this.todaySale,
        required this.weeklyTotal,
       required  this.weeklySale,
       required  this.monthlyTotal,
      required   this.monthlySale,
        required this.success,
    });

    String total;
    List<Order> orders;
    int totalOrderProducts;
    String totalOrderAmount;
    String todayTotal;
    String todaySale;
    String weeklyTotal;
    String weeklySale;
    String monthlyTotal;
    String monthlySale;
    Success success;

    factory HomeDashboardModel.fromJson(Map<String, dynamic> json) => HomeDashboardModel(
        total: json["total"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        totalOrderProducts: json["total_order_products"],
        totalOrderAmount: json["total_order_amount"],
        todayTotal: json["today_total"],
        todaySale: json["today_sale"],
        weeklyTotal: json["weekly_total"],
        weeklySale: json["weekly_sale"],
        monthlyTotal: json["monthly_total"],
        monthlySale: json["monthly_sale"],
        success: Success.fromJson(json["success"]),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "total_order_products": totalOrderProducts,
        "total_order_amount": totalOrderAmount,
        "today_total": todayTotal,
        "today_sale": todaySale,
        "weekly_total": weeklyTotal,
        "weekly_sale": weeklySale,
        "monthly_total": monthlyTotal,
        "monthly_sale": monthlySale,
        "success": success.toJson(),
    };
}

class Order {
    Order({
      required this.orderId,
       required  this.customer,
       required this.status,
       required this.products,
       required  this.total,
       required  this.dateAdded,
       required  this.dateModified,
       required this.dateDelivery,
       required this.shippingCode,
       required this.paymentMethod,
        required this.deliveryType,
       required this.orderType,
       required this.restaurant,
    });

    String orderId;
    String customer;
    String status;
    String products;
    String total;
    DateTime dateAdded;
    String dateModified;
    DateTime dateDelivery;
    String shippingCode;
    String paymentMethod;
    String deliveryType;
    String orderType;
    String restaurant;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        customer: json["customer"],
        status: json["status"],
        products: json["products"],
        total: json["total"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateModified: json["date_modified"],
        dateDelivery: DateTime.parse(json["date_delivery"]),
        shippingCode: json["shipping_code"],
        paymentMethod: json["payment_method"],
        deliveryType: json["delivery_type"],
        orderType: json["order_type"],
        restaurant: json["restaurant"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "customer": customer,
        "status": status,
        "products": products,
        "total": total,
        "date_added": dateAdded.toIso8601String(),
        "date_modified": dateModified,
        "date_delivery": dateDelivery.toIso8601String(),
        "shipping_code": shippingCode,
        "payment_method": paymentMethod,
        "delivery_type": deliveryType,
        "order_type": orderType,
        "restaurant": restaurant,
    };
}

class Success {
    Success({
      required  this.status,
      required  this.message,
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
