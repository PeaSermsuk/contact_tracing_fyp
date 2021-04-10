import 'package:cloud_firestore/cloud_firestore.dart';

class CheckIn {
  String deviceID;
  String room;
  Timestamp timeIn;
  Timestamp timeOut;
  int stat;
  CheckIn({this.deviceID, this.room, this.timeIn, this.timeOut, this.stat});
}