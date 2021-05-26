import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/covidpositive_db.dart';
//import 'package:contact_tracing_fyp/models/covidpositive.dart';
import 'package:flutter/material.dart';

class CovidPositiveProvider with ChangeNotifier {
  void insertData(String deviceid, Timestamp reportedTime) async {
    var cpdb = CovidPositiveDB();
    await cpdb.addCovidPositive(deviceid, reportedTime);
    await cpdb.handleCovidPositive(deviceid, reportedTime);
    notifyListeners();
  }
}
