import 'package:cloud_firestore/cloud_firestore.dart';

class CovidPositive {
  String deviceid;
  Timestamp reportedTime;
  CovidPositive({this.deviceid, this.reportedTime});
}