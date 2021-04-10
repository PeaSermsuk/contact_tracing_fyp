import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/models/roomuse.dart';

class TimeTableDB {
  String devID;
  int day;
  TimeTableDB({this.devID, this.day});

  Future<List<RoomUse>> getAllData(String devid, int dy) async {
    List<RoomUse> ruList = [];

    var ttref = FirebaseFirestore.instance.collection("timetable");
    var ruref =
        ttref.where('deviceid', isEqualTo: devid).where('day', isEqualTo: dy);

    await ruref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        ruList.add(RoomUse(
            day: snapshot.docs[key]["day"],
            hour: snapshot.docs[key]["hour"],
            roomName: snapshot.docs[key]["roomName"]));
      });
    }).catchError((error) {
      print("Failed to get roomuse: $error");
    });
    return ruList;
  }

  Future<void> setData(String devid, int dy, int hr, String rmName) async {
    String dockey = devid + dy.toString() + hr.toString();
    var ttref = FirebaseFirestore.instance.collection("timetable").doc(dockey);
    return ttref
        .set({
          "deviceid": devid,
          "day": dy,
          "hour": hr,
          "roomName": rmName,
        })
        .then((value) => print("Timetable Input Added"))
        .catchError((error) => print("Failed to add input: $error"));
  }
}

/* start old version of getAllData
Future<List<RoomUse>> getAllData() async {
    List<RoomUse> ruList = [];
    String deviceid = this.devID.toString();
    int ttable_day = this.day;
    print("this.devID = $deviceid");
    print("this.day = $ttable_day");
// from here must be modified
    var ttref = FirebaseFirestore.instance.collection("timetable");
    var ruref = ttref
        //.where('deviceid', isEqualTo: deviceid);
        .where('deviceid', isEqualTo: this.devID)
        .where('day', isEqualTo: this.day);
// to here
    await ruref.get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        ruList.add(RoomUse(
            day: snapshot.docs[key]["day"],
            hour: snapshot.docs[key]["hour"],
            roomName: snapshot.docs[key]["roomName"]));
      });
    }).catchError((error) {
      print("Failed to get roomuse: $error");
    });
    return ruList;
  }
end old version of getAllData*/