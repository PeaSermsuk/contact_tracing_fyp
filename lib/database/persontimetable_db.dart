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
}
