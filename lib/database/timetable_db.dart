//import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/models/roomuse.dart';

class TimeTableDB {
  String devID;
  int day;
  TimeTableDB({this.devID, this.day});

  //Future<List<RoomUse>> loadAllData(String dev, int day) async {
  Future<List<RoomUse>> loadAllData() async {
    List<RoomUse> ruList = [];
// from here must be modified
    var ttref = FirebaseFirestore.instance
        .collection("timetable")
        .doc("mhqjtN3wq33pMLYnKQhs")
        .collection("roomuse");
    var ruref = ttref.where('day', isEqualTo: this.day);
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
}

/*
db.collection("restaurants").doc("123").collection("reviews").get()
.then(querySnapshot => {
    querySnapshot.forEach(doc => {
        console.log(doc.id, " => ", doc.data());
    });
});

*/