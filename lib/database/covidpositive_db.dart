//import 'package:contact_tracing_fyp/models/covidpositive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CovidPositiveDB {
  CovidPositiveDB();

  Future<void> addCovidPositive(String deviceid, Timestamp reportedTime) async {
    String dockey = deviceid + ' ' + reportedTime.toDate().toString();
    var cpref = FirebaseFirestore.instance.collection("covidpositive").doc(dockey);
    return cpref
        .set({
          "deviceid": deviceid,
          "infecteddate": reportedTime,
        })
        .then((value) => print("COVID-19 Case Added"))
        .catchError((error) => print("Failed to add COVID-19 Case: $error"));
  }
}