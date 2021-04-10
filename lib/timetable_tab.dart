import 'dart:ffi';

import 'package:contact_tracing_fyp/models/roomuse.dart';
import 'package:contact_tracing_fyp/services/user_device.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_tracing_fyp/providers/roomuse_provider.dart';

import 'roomselect_page.dart';
//import 'widgets.dart';

class TimetableTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {
  List _times = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];

  List _days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  int dayIndex = 0;
  int chosenTimeIndex = 0;
  int wideFlex = 5;
  double boxHeight = 45;
  double roomFontSize = 16;
  var urdev = UserDevice();
  String deviceid; //= UserDevice().getDeviceID();

  @override
  Widget build(BuildContext context) {
    int size = _days.length;

    void nextValue() {
      if (dayIndex < size - 1) {
        setState(() {
          dayIndex++;
        });
      } else {
        setState(() {
          dayIndex = 0;
        });
      }
      //  print(dayIndex);
    }

    void previousValue() {
      if (dayIndex > 0) {
        setState(() {
          dayIndex--;
        });
      } else {
        setState(() {
          dayIndex = size - 1;
        });
      }
      //print(dayIndex);
    }

// will insert consumer here
    return Consumer<RoomUseProvider>(
      builder: (context, rupro, child) {
        Provider.value(value: rupro.devid = deviceid, child: child);
        Provider.value(value: rupro.day = dayIndex, child: child);
        deviceid = urdev.getDeviceID();
        print(deviceid);
        rupro.loadAllData();
        return Column(children: [
          Container(
            height: boxHeight,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
            //decoration: BoxDecoration(
            //  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
            //),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: previousValue,
                  child: Icon(
                    Icons.arrow_left,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
                Expanded(
                  child: Text(
                    _days[dayIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1,
                      fontSize: 20,
                      color: Colors.grey,
                      //fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: nextValue,
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
              ],
            ),
            // alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              //separatorBuilder: (context, index) => Divider(height: 1.0),
              itemCount: _times.length,
              itemBuilder: (context, index) {
                if (index < (_times.length - 1)) {
                  return Container(
                    color: Colors.white,
                    height: boxHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                _times[index],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  //fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: wideFlex,
                          child: Column(
                            children: [
                              Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    chosenTimeIndex = index;
                                    print("Select Time = $index");
                                    Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RoomSelectPage(
                                                        devid: deviceid,
                                                        day: dayIndex,
                                                        hour: index,
                                                        currentRoom: rupro.ruList[index],)))
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: Text(
                                          rupro.ruList[index],
                                          style: TextStyle(
                                            fontSize: roomFontSize,
                                            color: Colors.black,
                                            //fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // alignment: Alignment.bottomCenter,
                  );
                } else {
                  return Container(
                    color: Colors.white,
                    height: boxHeight + 10,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                _times[index],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: wideFlex,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              chosenTimeIndex = index;
                              print("Select Time 23 = $index");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RoomSelectPage(
                                          devid: deviceid,
                                          day: dayIndex,
                                          hour: index,
                                          currentRoom: rupro.ruList[index],))).then((value) {
                                setState(() {});
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, bottom: 10),
                                    child: Center(
                                      child: Text(
                                        rupro.ruList[index],
                                        style: TextStyle(
                                          fontSize: roomFontSize,
                                          color: Colors.black,
                                          //fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //Container(
                                //  height: 10,
                                //),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // alignment: Alignment.bottomCenter,
                  );
                }
              },
            ),
          ),
          /*Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey))),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'TIME',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: 15,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'ROOM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: 15,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // alignment: Alignment.bottomCenter,
      ),
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: times.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
              //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      times[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: 20,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'CAGB 200',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: 20,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              // alignment: Alignment.bottomCenter,
            );
          },
        ),
      )*/
        ]);
      },
    );
  }
}

List<String> mondayTimetable = List<String>(24);
List<String> tuesdayTimetable = List<String>(24);
List<String> wednesdayTimetable = List<String>(24);
List<String> thursdayTimetable = List<String>(24);
List<String> fridayTimetable = List<String>(24);
List<String> saturdayTimetable = List<String>(24);
List<String> sundayTimetable = List<String>(24);
