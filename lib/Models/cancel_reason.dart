// To parse this JSON data, do
//
//     final cancelReason = cancelReasonFromJson(jsonString);

import 'dart:convert';

CancelReason cancelReasonFromJson(String str) => CancelReason.fromJson(json.decode(str));

String cancelReasonToJson(CancelReason data) => json.encode(data.toJson());

class CancelReason {
    CancelReason({
        required this.reasons,
        required this.success,
    });

    List<Reason> reasons;
    Success success;

    factory CancelReason.fromJson(Map<String, dynamic> json) => CancelReason(
        reasons: List<Reason>.from(json["reasons"].map((x) => Reason.fromJson(x))),
        success: Success.fromJson(json["success"]),
    );

    Map<String, dynamic> toJson() => {
        "reasons": List<dynamic>.from(reasons.map((x) => x.toJson())),
        "success": success.toJson(),
    };
}

class Reason {
    Reason({
        required this.languageId,
        required this.reason,
        required this.reasonId,
        required this.sortOrder,
    });

    String languageId;
    String reason;
    String reasonId;
    String sortOrder;

    factory Reason.fromJson(Map<String, dynamic> json) => Reason(
        languageId: json["language_id"],
        reason: json["reason"],
        reasonId: json["reason_id"],
        sortOrder: json["sort_order"],
    );

    Map<String, dynamic> toJson() => {
        "language_id": languageId,
        "reason": reason,
        "reason_id": reasonId,
        "sort_order": sortOrder,
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
