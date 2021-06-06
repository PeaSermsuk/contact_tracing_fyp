import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/covidpositive_db.dart';
//import 'package:contact_tracing_fyp/models/covidpositive.dart';
import 'package:flutter/material.dart';

class CovidPositiveProvider with ChangeNotifier {
  void insertPositiveData(
      String deviceid, Timestamp infectedTime, Timestamp reportedTime) async {
    var cpdb = CovidPositiveDB();
    await cpdb.addCovidPositive(
        deviceid, infectedTime, 'Positive', reportedTime);
    //await cpdb.handleCovidPositive(deviceid, infectedTime);
    int yy = reportedTime.toDate().year;
    int mm = reportedTime.toDate().month;
    int dd = reportedTime.toDate().day;
    //print(dd);
    Timestamp reportedTimeReset =
        Timestamp.fromDate(DateTime(yy, mm, dd, 0, 0, 0));
    await cpdb.handleCovidPositive(deviceid, reportedTimeReset);
    notifyListeners();
  }

  void insertNonPositiveData(String deviceid, Timestamp infectedTime,
      String result, int resultNumber, Timestamp reportedTime) async {
    var cpdb = CovidPositiveDB();
    await cpdb.addCovidPositive(deviceid, infectedTime, result, reportedTime);
    //await cpdb.handleCovidPositive(deviceid, reportedTime);
    notifyListeners();
  }
}
