//import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/models/roomuse.dart';
import 'package:flutter/material.dart';

class RoomUseProvider with ChangeNotifier {
  List<RoomUse> ruList = [
    RoomUse(day: 0, hour: 0, roomName: 'A200'),
    RoomUse(day: 0, hour: 1, roomName: ''),
    RoomUse(day: 0, hour: 2, roomName: 'A10'),
    RoomUse(day: 0, hour: 3, roomName: ''),
    RoomUse(day: 0, hour: 4, roomName: 'A100'),
    RoomUse(day: 0, hour: 5, roomName: ''),
    RoomUse(day: 0, hour: 6, roomName: ''),
    RoomUse(day: 0, hour: 7, roomName: ''),
    RoomUse(day: 0, hour: 8, roomName: ''),
    RoomUse(day: 0, hour: 9, roomName: ''),
    RoomUse(day: 0, hour: 10, roomName: 'A200'),
    RoomUse(day: 0, hour: 11, roomName: ''),
    RoomUse(day: 0, hour: 12, roomName: ''),
    RoomUse(day: 0, hour: 13, roomName: ''),
    RoomUse(day: 0, hour: 14, roomName: ''),
    RoomUse(day: 0, hour: 15, roomName: ''),
    RoomUse(day: 0, hour: 16, roomName: ''),
    RoomUse(day: 0, hour: 17, roomName: ''),
    RoomUse(day: 0, hour: 18, roomName: 'A111'),
    RoomUse(day: 0, hour: 19, roomName: ''),
    RoomUse(day: 0, hour: 20, roomName: 'BBB'),
    RoomUse(day: 0, hour: 21, roomName: 'CCC'),
    RoomUse(day: 0, hour: 22, roomName: 'DDD'),
    RoomUse(day: 0, hour: 23, roomName: 'A200'),
  ];
  List<RoomUse> ru1List = [
    RoomUse(day: 0, hour: 0, roomName: 'A200'),
    RoomUse(day: 0, hour: 1, roomName: ''),
    RoomUse(day: 0, hour: 2, roomName: 'A10'),
    RoomUse(day: 0, hour: 3, roomName: ''),
    RoomUse(day: 0, hour: 4, roomName: 'A100'),
    RoomUse(day: 0, hour: 5, roomName: ''),
    RoomUse(day: 0, hour: 6, roomName: ''),
    RoomUse(day: 0, hour: 7, roomName: ''),
    RoomUse(day: 0, hour: 8, roomName: ''),
    RoomUse(day: 0, hour: 9, roomName: ''),
    RoomUse(day: 0, hour: 10, roomName: 'A200'),
    RoomUse(day: 0, hour: 11, roomName: ''),
    RoomUse(day: 0, hour: 12, roomName: ''),
    RoomUse(day: 0, hour: 13, roomName: ''),
    RoomUse(day: 0, hour: 14, roomName: ''),
    RoomUse(day: 0, hour: 15, roomName: ''),
    RoomUse(day: 0, hour: 16, roomName: ''),
    RoomUse(day: 0, hour: 17, roomName: ''),
    RoomUse(day: 0, hour: 18, roomName: 'A111'),
    RoomUse(day: 0, hour: 19, roomName: ''),
    RoomUse(day: 0, hour: 20, roomName: 'BBB'),
    RoomUse(day: 0, hour: 21, roomName: 'CCC'),
    RoomUse(day: 0, hour: 22, roomName: 'DDD'),
    RoomUse(day: 0, hour: 23, roomName: 'A200'),
  ];

  List<RoomUse> ru2List = [
    RoomUse(day: 0, hour: 0, roomName: 'A'),
    RoomUse(day: 0, hour: 1, roomName: 'B'),
    RoomUse(day: 0, hour: 2, roomName: 'C'),
    RoomUse(day: 0, hour: 3, roomName: 'D'),
    RoomUse(day: 0, hour: 4, roomName: 'A100'),
    RoomUse(day: 0, hour: 5, roomName: 'E'),
    RoomUse(day: 0, hour: 6, roomName: 'F'),
    RoomUse(day: 0, hour: 7, roomName: ''),
    RoomUse(day: 0, hour: 8, roomName: ''),
    RoomUse(day: 0, hour: 9, roomName: ''),
    RoomUse(day: 0, hour: 10, roomName: 'G'),
    RoomUse(day: 0, hour: 11, roomName: ''),
    RoomUse(day: 0, hour: 12, roomName: ''),
    RoomUse(day: 0, hour: 13, roomName: ''),
    RoomUse(day: 0, hour: 14, roomName: ''),
    RoomUse(day: 0, hour: 15, roomName: ''),
    RoomUse(day: 0, hour: 16, roomName: ''),
    RoomUse(day: 0, hour: 17, roomName: ''),
    RoomUse(day: 0, hour: 18, roomName: 'H'),
    RoomUse(day: 0, hour: 19, roomName: ''),
    RoomUse(day: 0, hour: 20, roomName: ''),
    RoomUse(day: 0, hour: 21, roomName: ''),
    RoomUse(day: 0, hour: 22, roomName: 'K'),
    RoomUse(day: 0, hour: 23, roomName: ''),
  ];

  List<RoomUse> getList() {
    return ruList;
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
}
