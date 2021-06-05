import 'dart:convert';

import 'package:contact_tracing_fyp/models/timetable.dart';

List<RiskDetail> riskDetailFromJson(String str) =>
    List<RiskDetail>.from(json.decode(str).map((x) => RiskDetail.fromJson(x)));

String riskDetailToJson(List<RiskDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiskDetail {
  RiskDetail({
    this.riskType,
    this.reportDate,
    this.riskText,
  });

  String riskType;
  DateTime reportDate;
  String riskText;

  factory RiskDetail.fromJson(Map<String, dynamic> json) => RiskDetail(
        riskType: json["riskType"] == null ? null : json["riskType"],
        reportDate: json["reportDate"] == null
            ? null
            : DateTime.parse(json["reportDate"]),
        riskText: json["riskText"] == null ? null : json["riskText"],
      );

  Map<String, dynamic> toJson() => {
        "riskType": riskType == null ? null : riskType,
        "reportDate": reportDate == null ? null : reportDate.toIso8601String(),
        "riskText": riskText == null ? null : riskText,
      };
}
