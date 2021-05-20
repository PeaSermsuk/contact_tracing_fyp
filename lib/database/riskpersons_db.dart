import 'package:contact_tracing_fyp/models/riskpersons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*class RiskPersonsDB {
  RiskPersonsDB();

  Future<RiskPersons> getRiskPersons(String devid) async {
    RiskPersons riskPersons;

    var rpref = FirebaseFirestore.instance.collection("riskpersons");
    var riskpersonsref =
        rpref.where('deviceid', isEqualTo: devid)/*.where('stat', isEqualTo: 0)*/;

    await riskpersonsref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        riskPersons.add(RiskPersons(
            deviceID: snapshot.docs[key]["deviceid"],
            riskType: snapshot.docs[key]["room"],
            reportDate: snapshot.docs[key]["timein"],//.toDate(),
            cause: snapshot.docs[key]["stat"]));
      });
    }).catchError((error) {
      print("Failed to get RiskPersons data: $error");
    });
    return riskPersons;
  }

  Future<void> addData(String devid, String room, Timestamp timein) async {
    String dockey = devid + ' ' + timein.toDate().toString();
    var ciref = FirebaseFirestore.instance.collection("checkins").doc(dockey);
    return ciref
        .set({
          "deviceid": devid,
          "room": room,
          "timein": timein,
          "timeout": null,
          "stat": 0,
        })
        .then((value) => print("Check In Input Added"))
        .catchError((error) => print("Failed to add Check In: $error"));
  }

  Future<void> updateData(String devid, Timestamp timein, Timestamp timeout) async {
    String dockey = devid + ' ' + timein.toDate().toString();
    var ciref = FirebaseFirestore.instance.collection("checkins").doc(dockey);
    return ciref
        .update({
          "timeout": timeout,
          "stat": 1,
        })
        .then((value) => print("Check In Input Updated"))
        .catchError((error) => print("Failed to update Check In: $error"));
  }
}*/