import 'package:contact_tracing_fyp/models/checkin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckInDB {
  CheckInDB();

  Future<List<CheckIn>> getAllCheckInData(String devid) async {
    List<CheckIn> checkinList = [];

    var ciref = FirebaseFirestore.instance.collection("checkins");
    var checkinref =
        ciref.where('deviceid', isEqualTo: devid).where('stat', isEqualTo: 0);

    await checkinref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        checkinList.add(CheckIn(
            deviceID: snapshot.docs[key]["deviceid"],
            room: snapshot.docs[key]["room"],
            timeIn: snapshot.docs[key]["timein"], //.toDate(),
            timeOut: snapshot.docs[key]["timeout"], //.toDate(),
            stat: snapshot.docs[key]["stat"]));
      });
    }).catchError((error) {
      print("Failed to get CheckIn List: $error");
    });
    return checkinList;
  }

  Future<void> addData(
      String devid, String room, Timestamp timein, int roomsize) async {
    String dockey = devid + ' ' + timein.toDate().toString();
    var ciref = FirebaseFirestore.instance.collection("checkins").doc(dockey);
    return ciref
        .set({
          "deviceid": devid,
          "room": room,
          "timein": timein,
          "timeout": null,
          "stat": 0,
          "roomsize": roomsize,
        })
        .then((value) => print("Check In Input Added"))
        .catchError((error) => print("Failed to add Check In: $error"));
  }

  Future<void> updateData(
      String devid, Timestamp timein, Timestamp timeout) async {
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

  // get checkinList of devid start from fdate
  Future<List<CheckIn>> getCheckinRoomRisk(
      String devid, Timestamp fdate, Timestamp tdate) async {
    List<CheckIn> checkinRiskList = [];

    var ciref = FirebaseFirestore.instance.collection("checkins");
    var checkinref = ciref
        .where('deviceid', isEqualTo: devid)
        .where('timein', isGreaterThanOrEqualTo: fdate)
        .where('timein', isLessThanOrEqualTo: tdate);
    await checkinref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        checkinRiskList.add(CheckIn(
            deviceID: snapshot.docs[key]["deviceid"],
            room: snapshot.docs[key]["room"],
            timeIn: snapshot.docs[key]["timein"], //.toDate(),
            timeOut: snapshot.docs[key]["timeout"], //.toDate(),
            stat: snapshot.docs[key]["stat"],
            roomsize: snapshot.docs[key]["roomsize"]));
      });
    }).catchError((error) {
      print("Failed to get CheckIn Risk List: $error");
    });
    return checkinRiskList;
  }

  Future<List<CheckIn>> getRiskPersonsCheckinRoom(
      String cvpid, String croom, Timestamp ftime, Timestamp ttime) async {
    List<CheckIn> checkinList = [];

    var ciref = FirebaseFirestore.instance.collection("checkins");
    // room - name of room used
    // ftime - check in date at 12AM
    // ttime - check out date and time
    // obtains all check ins from 12AM to check out time
    var checkinref = ciref
        .where('room', isEqualTo: croom)
        .where('timein', isGreaterThanOrEqualTo: ftime)
        .where('timein', isLessThanOrEqualTo: ttime);
    await checkinref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        if (snapshot.docs[key]["deviceid"] != cvpid) {
          checkinList.add(CheckIn(
              deviceID: snapshot.docs[key]["deviceid"],
              room: snapshot.docs[key]["room"],
              timeIn: snapshot.docs[key]["timein"], //.toDate(),
              timeOut: snapshot.docs[key]["timeout"], //.toDate(),
              stat: snapshot.docs[key]["stat"],
              roomsize: snapshot.docs[key]["roomsize"]));
        }
      });
    }).catchError((error) {
      print("Failed to get CheckIn by room List: $error");
    });
    return checkinList;
  }
}
