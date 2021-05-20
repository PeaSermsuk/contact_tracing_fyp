import 'package:cloud_firestore/cloud_firestore.dart';

class RiskPersons {
  String deviceID;
  String riskType;
  Timestamp reportDate;
  String cause;
  RiskPersons({this.deviceID, this.riskType, this.reportDate, this.cause});
}