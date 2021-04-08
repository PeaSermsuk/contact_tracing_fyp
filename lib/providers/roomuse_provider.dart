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

  List<String> getList() {
    return ruList;
  }

  void initList() {
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

  void prtData() {
    String did = this.devid;
    int dd = this.day;
    print("device id = $did");
    print("day = $dd");
    loadAllData();
  }

/*
  List<RoomUse> getList() {
    this.loadAllData();
    return rmList;
  }
*/
  void loadAllData() async {
    /*
    List<RoomUse> nuList = [
      RoomUse(day: 0, hour: 0, roomName: ''),
      RoomUse(day: 0, hour: 1, roomName: ''),
      RoomUse(day: 0, hour: 2, roomName: ''),
      RoomUse(day: 0, hour: 3, roomName: ''),
      RoomUse(day: 0, hour: 4, roomName: ''),
      RoomUse(day: 0, hour: 5, roomName: ''),
      RoomUse(day: 0, hour: 6, roomName: ''),
      RoomUse(day: 0, hour: 7, roomName: ''),
      RoomUse(day: 0, hour: 8, roomName: ''),
      RoomUse(day: 0, hour: 9, roomName: ''),
      RoomUse(day: 0, hour: 10, roomName: ''),
      RoomUse(day: 0, hour: 11, roomName: ''),
      RoomUse(day: 0, hour: 12, roomName: ''),
      RoomUse(day: 0, hour: 13, roomName: ''),
      RoomUse(day: 0, hour: 14, roomName: ''),
      RoomUse(day: 0, hour: 15, roomName: ''),
      RoomUse(day: 0, hour: 16, roomName: ''),
      RoomUse(day: 0, hour: 17, roomName: ''),
      RoomUse(day: 0, hour: 18, roomName: ''),
      RoomUse(day: 0, hour: 19, roomName: ''),
      RoomUse(day: 0, hour: 20, roomName: ''),
      RoomUse(day: 0, hour: 21, roomName: ''),
      RoomUse(day: 0, hour: 22, roomName: ''),
      RoomUse(day: 0, hour: 23, roomName: ''),
    ]; */
    List<RoomUse> loadList = [];
    var ttdb = TimeTableDB(devID: this.devid, day: this.day);
    loadList = await ttdb.loadAllData();
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
      print(ru.day);
      print(ru.hour);
      print(ru.roomName);
      ruList[ru.hour] = ru.roomName;
    }
    notifyListeners();
  }
}

/*


  List<RoomUse> getList() {
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
  */

