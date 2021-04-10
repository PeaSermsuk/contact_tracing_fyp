import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/checkin_db.dart';
import 'package:contact_tracing_fyp/models/checkin.dart';
import 'package:flutter/material.dart';

class CheckInProvider with ChangeNotifier {
  List<CheckIn> checkinList = [];

  void loadAllData(String deviceID) async {
    var cidb = CheckInDB();
    checkinList = await cidb.getAllCheckInData(deviceID);
    notifyListeners();
  }

  void insertData(String deviceID, String roomName, Timestamp timeIn) async {
    var cidb = CheckInDB();
    await cidb.addData(deviceID, roomName, timeIn);
    notifyListeners();
  }

    void updateData(String deviceID, Timestamp timeIn, Timestamp timeOut) async {
    var cidb = CheckInDB();
    await cidb.updateData(deviceID, timeIn, timeOut);
    notifyListeners();
  }
}
