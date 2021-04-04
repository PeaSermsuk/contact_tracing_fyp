import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RoomsDB {
  RoomsDB();

  Future<List<Rooms>> getAllData() async {
    // List<Rooms> loadAllData() async {
    List<Rooms> rmList = [];
    var rmref = FirebaseFirestore.instance.collection('rooms');
    //Future<QuerySnapshot>

    await rmref
    .orderBy('roomName', descending: false)
    .get().then((snapshot) {
      snapshot.docs.asMap().forEach((key, value) {
        rmList.add(Rooms(
            name: snapshot.docs[key]["name"],
            capacity: snapshot.docs[key]["capacity"],
            available: snapshot.docs[key]["available"]));
      });
    }).catchError((error) {
      print("Failed to get room: $error");
    });
    print("rmList = $rmList");  // to show data received
    return rmList;
  }

}