import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/checkin_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:contact_tracing_fyp/models/riskpersons.dart';
import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/database/riskpersons_db.dart';
import 'package:contact_tracing_fyp/providers/checkin_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:contact_tracing_fyp/services/user_device.dart';
import 'package:barcode_scan/barcode_scan.dart';
//import 'package:permission_handler/permission_handler.dart';

import 'models/checkin.dart';
//import 'widgets.dart';

class CheckInTab extends StatefulWidget {
  static const title = 'CHECK IN';
  static const setIcon = Icon(Icons.qr_code_scanner_rounded);

  @override
  _CheckInTabState createState() => _CheckInTabState();
}

class _CheckInTabState extends State<CheckInTab> {
  String result = "";
  DateTime timeIn;
  var checkinDB = CheckInDB();
  var roomsDB = RoomsDB();
  var riskpersonsDB = RiskPersonsDB();
  Rooms rmInfo;
  RiskPersons riskPerson;
  int loading = 1;
  var difference;
  var remaining = 0;
  final isolateLdays = 10;
  final isolateHdays = 10;
  final isolatePdays = 10;
  //var rmpro = RoomProvider();
  //List<Rooms> roomInfo = [];

  @override
  void initState() {
    super.initState();
    this.initList();
  }

  void initList() async {
    riskPerson = await riskpersonsDB.getData(user_devid);
    if (riskPerson.reportDate != null) {
      Timestamp reportedTimestamp = riskPerson.reportDate;
      DateTime reportedDateTime = DateTime.fromMicrosecondsSinceEpoch(
          reportedTimestamp.microsecondsSinceEpoch);
      DateTime timeNow = DateTime.now();
      difference = timeNow.difference(reportedDateTime).inDays;
      if (riskPerson.riskType == 'H') {
        remaining = isolateHdays - difference;
      } else if (riskPerson.riskType == 'P') {
        remaining = isolatePdays - difference;
      }
    }
    loading = 0;
    setState(() {});
  }

  Future _scanQR() async {
/* start test 
    result = 'CAGB 309';
    rmInfo = await roomsDB.getData(result);
    setState(() {
      print(
          'room = ' + result + ', room size = ' + rmInfo.available.toString());
      checkinDB.addData(user_devid, result, Timestamp.now(), rmInfo.capacity);
      roomsDB.updateData(result, rmInfo.capacity, rmInfo.available - 1);
    });
end test */
    try {
      String qrResult = await BarcodeScanner.scan();
      result = qrResult;
      rmInfo = await roomsDB.getData(result);
      setState(() {
        //result = qrResult;
        print(result);
        checkinDB.addData(user_devid, result, Timestamp.now(), rmInfo.capacity);
        roomsDB.updateData(result, rmInfo.capacity, rmInfo.available - 1);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
          print(result);
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          print(result);
        });
      }
    } on FormatException {
      // If back button pressed
      setState(() {
        result = "You pressed the back button before scanning";
        print(result);
      });
    } catch (ex) {
      //String roomNum = 'CAGB 200';
      //rmInfo = await roomsDB.getData(roomNum);
      //await rmpro.getRoom(roomNum);
      //print('print rmpro.rm');
      //print(rmpro.rm);
      //print(rmpro.rm.capacity);
      setState(() {
        result = "Unknown Error2 $ex";
        print(result);
        /*checkinDB.addData(user_devid, roomNum, Timestamp.now());
        roomsDB.updateData(roomNum, rmInfo.capacity,
            rmInfo.available - 1);*/
      });
    }
  }

  Widget build(BuildContext context) {
    return Consumer<CheckInProvider>(
      builder: (context, checkinpro, child) {
        checkinpro.loadAllData(user_devid);
        //roomInfo = rmpro.getList();
        //_getRiskPersons();
        //print('Risk Level is $riskPerson.riskType');
        List<CheckIn> ciList = checkinpro.checkinList;
        return Column(children: [
          GestureDetector(
            onTap: null,
            /*onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReportPage())),*/
            // put the command to the page here
            child: Container(
              height: 48.0,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text('COVID-19 Status', style: TextStyle(fontSize: 16)),
                  Spacer(),
                  if (loading == 1) ...[
                    Text('LOADING',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ] else ...[
                    if (riskPerson.riskType == 'L' &&
                        difference <= isolateLdays) ...[
                      Text('LOW RISK',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                    ] else if (riskPerson.riskType == 'H' &&
                        difference <= isolateHdays) ...[
                      Text('HIGH RISK',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontWeight: FontWeight.bold)),
                    ] else if (riskPerson.riskType == 'P' &&
                        difference <= isolatePdays) ...[
                      Text('COVID-19 POSITIVE',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ] else ...[
                      Text('NO RISK',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                              fontWeight: FontWeight.bold)),
                    ]
                  ]
                ],
              ),
            ),
          ),
          if (ciList.length != 0) ...[
            Container(
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
              child: Text(
                'Currently checked in at:',
                style: TextStyle(
                  height: 1,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Expanded(
              child: ListView.builder(
                //clipBehavior: Clip.none,
                //separatorBuilder: (context, index) => Divider(height: 1.0),
                itemCount: ciList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    //height: 100,
                    /*padding: EdgeInsets.only(
                  left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),*/
                    margin: EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
                    //color: Colors.white,
                    /*decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),*/
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 20.0, top: 20.0),
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              ciList[index].room,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              String roomNum = ciList[index].room;
                              rmInfo = await roomsDB.getData(roomNum);
                              checkinpro.updateData(user_devid,
                                  ciList[index].timeIn, Timestamp.now());
                              roomsDB.updateData(ciList[index].room,
                                  rmInfo.capacity, rmInfo.available + 1);
                            },
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.black,
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // alignment: Alignment.bottomCenter,
                  );
                },
              ),
            ),
          ] else ...[
            Expanded(
              child: (Container(
                //padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.all(30.0),
                //color: Colors.black,
                child: (loading == 0)
                    ? ((riskPerson.riskType == 'H' &&
                                difference <= isolateHdays) ||
                            (riskPerson.riskType == 'P' &&
                                difference <= isolatePdays))
                        ? (remaining == 1)
                            ? Text(
                                'CHECK IN DISABLED\n\nPLEASE SELF-ISOLATE FOR $remaining DAY',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.25,
                                    fontSize: 25,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                'CHECK IN DISABLED\n\nPLEASE SELF-ISOLATE FOR $remaining DAYS',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.25,
                                    fontSize: 25,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              )
                        : Text(
                            'NO CHECK-INS',
                            style: TextStyle(
                                height: 1,
                                fontSize: 25,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                    : Text(
                        'LOADING',
                        style: TextStyle(
                            height: 1,
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                alignment: Alignment.center,
              )),
            ),
          ],
          //Spacer(),
          if (loading == 1) ...[
            GestureDetector(
              onTap: () {
                if (loading == 0) {
                  _scanQR();
                }
              },
              child: Container(
                height: 100,
                padding: EdgeInsets.only(
                    left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
                margin: EdgeInsets.all(20.0),
                alignment: Alignment.bottomCenter,
                //color: Colors.black,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'SCAN QR CODE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1,
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ],
                ),
              ),
              // alignment: Alignment.bottomCenter,
            ),
          ] else ...[
            if ((riskPerson.riskType == 'H' && difference <= isolateHdays) ||
                (riskPerson.riskType == 'P' && difference <= isolatePdays))
              ...[]
            else ...[
              GestureDetector(
                onTap: () {
                  if (loading == 0) {
                    _scanQR();
                  }
                },
                child: Container(
                  height: 100,
                  padding: EdgeInsets.only(
                      left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
                  margin: EdgeInsets.all(20.0),
                  alignment: Alignment.bottomCenter,
                  //color: Colors.black,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'SCAN QR CODE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 1,
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.qr_code_scanner_rounded,
                        color: Colors.white,
                        size: 60,
                      ),
                    ],
                  ),
                ),
                // alignment: Alignment.bottomCenter,
              ),
            ]
          ]
        ]);
      },
    );
  }

  void printCI(int index) {
    print(index);
  }

/*  Widget scanButton = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Text(
            'SCAN QR CODE',
            style: TextStyle(
                height: 1,
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        /*2*/
        Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.red[500],
        ),
      ],
    ),
  );*/
}

/*class CheckInTab extends StatefulWidget {
  static const title = 'CHECK IN';
  static const setIcon = Icon(Icons.qr_code_scanner_rounded);

  @override
  _CheckInTabState createState() => _CheckInTabState();
}

class _CheckInTabState extends State<CheckInTab> {
  String result = "";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        print(result);
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
          print(result);
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          print(result);
        });
      }
    } on FormatException {
      // If back button pressed
      setState(() {
        result = "You pressed the back button before scanning";
        print(result);
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        print(result);
      });
    }
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(5.0),
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Text(
          'Currently checked in at:',
          style: TextStyle(
            height: 1,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        alignment: Alignment.topLeft,
      ),
      Expanded(
        child: ListView.builder(
          //clipBehavior: Clip.none,
          //separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //height: 100,
              /*padding: EdgeInsets.only(
                  left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),*/
              margin: EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
              //color: Colors.white,
              /*decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),*/
              child: Container(
                padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, bottom: 20.0, top: 20.0),
                height:100,
                child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'CAGB 200',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1,
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                      size: 60,
                    ),
                  ),
                ],
              ),
              ),
              // alignment: Alignment.bottomCenter,
            );
          },
        ),
      ),
      /*Expanded(
        child: (Container(
          padding: EdgeInsets.all(30.0),
          margin: EdgeInsets.all(30.0),
          //color: Colors.black,
          child: Text(
            'NO CHECK-INS',
            style: TextStyle(
                height: 1,
                fontSize: 25,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        )),
      ),*/
      //Spacer(),
      GestureDetector(
        onTap: _scanQR,
        child: Container(
          height: 100,
          padding:
              EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
          margin: EdgeInsets.all(20.0),
          alignment: Alignment.bottomCenter,
          //color: Colors.black,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'SCAN QR CODE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1,
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.white,
                size: 60,
              ),
            ],
          ),
        ),
        // alignment: Alignment.bottomCenter,
      ),
    ]);
  }

/*  Widget scanButton = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Text(
            'SCAN QR CODE',
            style: TextStyle(
                height: 1,
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        /*2*/
        Icon(
          Icons.qr_code_scanner_rounded,
          color: Colors.red[500],
        ),
      ],
    ),
  );*/
}
*/

/*class BarcodeScanner {
  static const CameraAccessDenied = 'PERMISSION_NOT_GRANTED';
  static const MethodChannel _channel =
      const MethodChannel('com.appletreesoftware.barcode_scan');
  static Future<String> scan() async => await _channel.invokeMethod('scan');
}*/
