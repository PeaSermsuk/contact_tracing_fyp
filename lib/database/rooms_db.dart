import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsDB {
  RoomsDB();

  Future<List<Rooms>> getAllData() async {
    // List<Rooms> loadAllData() async {
    List<Rooms> rmList = [];
    var rmref = FirebaseFirestore.instance.collection('rooms');

    await rmref
        .orderBy(
          "name",
          descending: false,
        )
        .get()
        .then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        rmList.add(Rooms(
            name: snapshot.docs[key]["name"],
            capacity: snapshot.docs[key]["capacity"],
            available: snapshot.docs[key]["available"]));
      });
    }).catchError((error) {
      print("Failed to get room: $error");
    });
    //  print(rmList);
    return rmList;
  }

  Future<Rooms> getData(String roomName) async {
    // List<Rooms> loadAllData() async {
    var rm = Rooms();
    var rmref = FirebaseFirestore.instance.collection('rooms').doc(roomName);

    await rmref.get().then((DocumentSnapshot rmDoc) {
      /*print('This is rmDoc.data');
      print(rmDoc.data());
      print('Next is available');
      print(rmDoc.data()["available"]);
      print('Next is capacity');
      print(rmDoc.data()["capacity"]);*/
      rm.available = rmDoc.data()["available"];
      rm.capacity = rmDoc.data()["capacity"];
      rm.name = rmDoc.data()["name"];
      //print('print rm.available');
      //print(rm.available);
      //print('print rm.capacity');
      //print(rm.capacity);
      //print('print rm.name');
      //print(rm.name);
      //m.available: rmDoc.data();
        });
        /*.then((snapshot) {
      snapshot.asMap().forEach((key, value) {
        rm.add(Rooms(
            name: snapshot.docs[key]["name"],
            capacity: snapshot.docs[key]["capacity"],
            available: snapshot.docs[key]["available"]));
      });
    }).catchError((error) {
      print("Failed to get room: $error");
    });
    //  print(rmList);
    return rmList;*/
    //print('rm is $rm');
    return rm;
  }

  Future<void> updateData(String roomName, int capacity, int available) async {
    var rmref = FirebaseFirestore.instance.collection("rooms").doc(roomName);
    //Future<Rooms> roomData = getData(roomName);
    return rmref
        .update({
          "capacity": capacity,
          "available": available,
        })
        .then((value) => print("Room Availability Updated"))
        .catchError(
            (error) => print("Failed to update Room Availability: $error"));
  }
}
