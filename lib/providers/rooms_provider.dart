import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:flutter/material.dart';

class RoomProvider with ChangeNotifier {
  List<Rooms> rmList = [];

  List<Rooms> getList() {
    this.loadAllData();
    return rmList;
  }

  void loadAllData() async {
    var rmdb = RoomsDB();
    rmList = await rmdb.getAllData();
    //notifyListeners();
  }

  void initData() async {
    var rmdb = RoomsDB();
    rmList = await rmdb.getAllData();
    //notifyListeners();
  }
}
