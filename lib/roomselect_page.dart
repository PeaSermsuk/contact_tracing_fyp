import 'package:contact_tracing_fyp/providers/roomuse_provider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

import 'database/rooms_db.dart';
import 'models/rooms.dart';
//import 'widgets.dart';
//import 'search_tab.dart';
//import 'timetable_tab.dart';

class RoomSelectPage extends StatefulWidget {
  final String devid;
  final int day;
  final int hour;
  RoomSelectPage(
      {Key key, @required this.devid, @required this.day, @required this.hour})
      : super(key: key);
  @override
  _RoomSelectPageState createState() => _RoomSelectPageState();
}

class _RoomSelectPageState extends State<RoomSelectPage> {
  List<Rooms> roomList = [];
  int loading = 1;

  @override
  void initState() {
    super.initState();
    this.initList();
    //print("room select-dayIndex=$dayIndex");
  }

  void initList() async {
    var rmdb = RoomsDB();
    roomList = await rmdb.getAllData();
    loading = 0;
    setState(() {});
  }

  /*void initList() async {
    var rmdb = RoomsDB();
    roomList = await rmdb.getAllData();
    // setState(() {});
  }*/

  Widget build(BuildContext context) {
    //initList();
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          //onPressed: () {
          //  Navigator.pop(context);
          //},
        ),
        //leading: Icon(
        //  Icons.arrow_back_ios,
        //  color: Colors.black,
        //  ),
        title: Text(
          'SELECT ROOM',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: (loading == 1)
          ? Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (context, index) => Divider(height: 1.5),
              itemCount: roomList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    var rupro = RoomUseProvider();
                    rupro.insertData(widget.devid, widget.day, widget.hour,
                        roomList[index].name);
                    /*if (dayIndex == 0) {
                      mondayTimetable[chosenTimeIndex] = roomList[index].name;
                    }
                    if (dayIndex == 1) {
                      tuesdayTimetable[chosenTimeIndex] = roomList[index].name;
                    }
                    if (dayIndex == 2) {
                      wednesdayTimetable[chosenTimeIndex] =
                          roomList[index].name;
                    }
                    if (dayIndex == 3) {
                      thursdayTimetable[chosenTimeIndex] = roomList[index].name;
                    }
                    if (dayIndex == 4) {
                      fridayTimetable[chosenTimeIndex] = roomList[index].name;
                    }
                    if (dayIndex == 5) {
                      saturdayTimetable[chosenTimeIndex] = roomList[index].name;
                    }
                    if (dayIndex == 6) {
                      sundayTimetable[chosenTimeIndex] = roomList[index].name;
                    }*/
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      roomList[index].name,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
      //body: Container(
      //  child: Text('Hi')
      //),
    );
  }
}
