import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:contact_tracing_fyp/models/roomuse.dart';
import 'package:contact_tracing_fyp/models/timetable.dart';
import 'package:flutter/material.dart';

class TimeTableProvider with ChangeNotifier {
  String devID;
  int day;
  List<RoomUse> ruList;

  List<RoomUse> getList() {
    //  this.loadAllData();
    return ruList;
  }
}
/*
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
*/