import 'package:contact_tracing_fyp/database/timetable_db.dart';
import 'package:contact_tracing_fyp/models/roomuse.dart';
import 'package:flutter/material.dart';

class RoomUseProvider with ChangeNotifier {
  String devid;
  int day;
  List<String> ruList = [];

  // RoomUseProvider({this.devid, this.day});
  RoomUseProvider() {
    this.devid;
    this.day;
    // initial rulist to list of 24 null strings
    this.ruList = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      ''
    ];
  }

  void loadAllData() async {
    List<RoomUse> loadList = [];
    var ttdb = TimeTableDB(devID: this.devid, day: this.day);
    print(this.devid);
    print(this.day);
    loadList = await ttdb.getAllData();
    ruList = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      ''
    ];
    for (var ru in loadList) {
      ruList[ru.hour] = ru.roomName;
    }
    notifyListeners();
  }

  void insertData(String devid, int dy, int hr, String rmName) {
    var ttdb = TimeTableDB();
    ttdb.setData(devid, dy, hr, rmName);
    notifyListeners();
  }
}
