import 'package:contact_tracing_fyp/models/riskpersons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RiskPersonsDB {
  RiskPersonsDB();
/*
  Future<List<RiskPersons>> getRiskPersons(String devid) async {
    List<RiskPersons> riskPersons;

    var rpref = FirebaseFirestore.instance.collection("riskpersons");
    var riskpersonsref = rpref.where('deviceid',
        isEqualTo: devid) /*.where('stat', isEqualTo: 0)*/;

    await riskpersonsref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        riskPersons.add(RiskPersons(
            deviceID: snapshot.docs[key]["deviceid"],
            riskType: snapshot.docs[key]["room"],
            reportDate: snapshot.docs[key]["timein"], //.toDate(),
            cause: snapshot.docs[key]["stat"]));
      });
    }).catchError((error) {
      print("Failed to get RiskPersons data: $error");
    });
    return riskPersons;
  }
*/

  Future<RiskPersons> getData(String personalID) async {
    var rp = RiskPersons();
    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);

    await rpref.get().then((DocumentSnapshot rpDoc) {
      rp.deviceID = rpDoc.data()["deviceid"];
      rp.reportDate = rpDoc.data()["reportdate"];
      rp.riskType = rpDoc.data()["risktype"];
      rp.cause = rpDoc.data()["cause"];
    });

    return rp;
  }

  Future<void> setData(String personalID, Timestamp reportedTime,
      String risktype, String cause) async {
    //var rp = RiskPersons();
    String riskCause;
    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);

    await rpref.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        riskCause = docSnapshot.data()["cause"] + cause + '\n';
      } else {
        riskCause = cause;
      }
    });
    await addData(personalID, reportedTime, risktype, riskCause);
    /*
    return rpref
        .set({
          "deviceid": personalID,
          "reportdate": reportedTime,
          "risktype": risktype,
          "cause": riskCause,
        })
        .then((value) => print("Person Risk Level Added"))
        .catchError((error) => print("Failed to add person: $error"));
        */
  }

  Future<void> addData(String personalID, Timestamp reportedTime,
      String risktype, String cause) async {
    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);
    //Future<Rooms> roomData = getData(roomName);
    await rpref
        .set({
          "deviceid": personalID,
          "reportdate": reportedTime,
          "risktype": risktype,
          "cause": cause,
        })
        .then((value) => print("Person Risk Level Added"))
        .catchError((error) => print("Failed to add person: $error"));
  }

  Future<void> addNewUserData(String personalID, Timestamp reportedTime,
      String risktype, String cause) async {
    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);

    await rpref.get().then((docSnapshot) {
      if (docSnapshot.exists) {
      } else {
        addData(personalID, reportedTime, risktype, cause);
      }
    });
  }
  
}
