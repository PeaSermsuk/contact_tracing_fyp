import 'package:contact_tracing_fyp/models/riskdetail.dart';
import 'package:contact_tracing_fyp/models/riskpersons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RiskPersonsDB {
  RiskPersonsDB();

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
    String db_risktype;
    String inriskType = risktype;
    Timestamp db_reportedTime;
    List<RiskDetail> riskList = [];

    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);

    await rpref.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        riskCause = docSnapshot.data()["cause"];
        // convert json-string to list<RiskDetail>
        riskList = riskDetailFromJson(riskCause);
        db_risktype = docSnapshot.data()["risktype"];
        db_reportedTime = docSnapshot.data()["reportdate"];
        if (reportedTime.toDate().difference(db_reportedTime.toDate()).inDays <
            14) {
          if (db_risktype == 'P' || db_risktype == 'H') {
            risktype = db_risktype;
          }
        }
      }
      riskList.add(RiskDetail(
          riskType: inriskType,
          reportDate: reportedTime.toDate(),
          riskText: cause));
    });
    // convert riskList to string-of-json to save in db
    riskCause = riskDetailToJson(riskList);
    await addData(personalID, reportedTime, risktype, riskCause);
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

// old version of some functions in this class
/*
Future<void> setData(String personalID, Timestamp reportedTime,
      String risktype, String cause) async {
    //var rp = RiskPersons();
    String riskCause;
    String db_risktype;
    Timestamp db_reportedTime;

    var rpref =
        FirebaseFirestore.instance.collection("riskpersons").doc(personalID);

    await rpref.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        riskCause = docSnapshot.data()["cause"] + '\n' + cause;
        db_risktype = docSnapshot.data()["risktype"];
        db_reportedTime = docSnapshot.data()["reportdate"];
        if (reportedTime.toDate().difference(db_reportedTime.toDate()).inDays <
            14) {
          if (db_risktype == 'P' || db_risktype == 'H') {
            risktype = db_risktype;
          }
        }
      } else {
        riskCause = cause;
      }
    });
    await addData(personalID, reportedTime, risktype, riskCause);
  }
*/
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