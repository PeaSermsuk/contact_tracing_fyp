import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/models/persontimetable.dart';

class PersonTimeTableDB {
  PersonTimeTableDB();

  Future<List<PersonTimeTable>> getAllData(String devid) async {
    List<PersonTimeTable> ttList = [];

    var ttcol = FirebaseFirestore.instance.collection("timetable");
    var ptref = ttcol.where('deviceid', isEqualTo: devid);

    await ptref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        ttList.add(PersonTimeTable(
            devid: snapshot.docs[key]["deviceid"],
            day: snapshot.docs[key]["day"],
            hour: snapshot.docs[key]["hour"],
            roomName: snapshot.docs[key]["roomName"]));
      });
    }).catchError((error) {
      print("Failed to get timetable: $error");
    });
    return ttList;
  }

  Future<List<PersonTimeTable>> getRiskPersonsfromTimeTable(
      String cvpid, int day, int hour, String room) async {
    List<PersonTimeTable> ttriskList = [];

    var ttref = FirebaseFirestore.instance.collection("timetable");
    // cvpid - id ผู้ติด covid
    // day, hour, room -> timetable's day, hour, room
    var riskttref = ttref
        .where('day', isEqualTo: day)
        .where('hour', isEqualTo: hour)
        .where('roomName', isEqualTo: room);
    await riskttref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        if (snapshot.docs[key]["deviceid"] != cvpid) {
          ttriskList.add(PersonTimeTable(
              devid: snapshot.docs[key]["deviceid"],
              day: snapshot.docs[key]["day"],
              hour: snapshot.docs[key]["hour"],
              roomName: snapshot.docs[key]["roomName"]));
        }
      });
    }).catchError((error) {
      print("Failed to get risk of timetableList: $error");
    });
    return ttriskList;
  }
}
