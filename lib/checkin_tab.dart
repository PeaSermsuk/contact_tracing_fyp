import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/checkin_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/providers/rooms_provider.dart';
import 'package:contact_tracing_fyp/providers/checkin_provider.dart';
import 'package:flutter/material.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:contact_tracing_fyp/services/user_device.dart';

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
  var rmpro = RoomProvider();
  List<Rooms> roomInfo = [];

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        print(result);
        checkinDB.addData(user_devid, qrResult, Timestamp.now());
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
        result = "Unknown Error2 $ex";
        print(result);
        String roomNum = 'CAGB 202C';
        checkinDB.addData(user_devid, roomNum, Timestamp.now());
        //rmpro.getRoom('CAGB 202C');
        print('below is roomInfo');
        print(roomInfo);
        final indexRoom =
            roomInfo.indexWhere((element) => element.name == roomNum);
        print(indexRoom);
        roomsDB.updateData(roomNum, roomInfo[indexRoom].capacity,
            roomInfo[indexRoom].available - 1);
        print(roomInfo[indexRoom].available - 1);
        //rm = await roomsDB.getData('CAGB 202C');
      });
    }
  }

  Widget build(BuildContext context) {
    return Consumer<CheckInProvider>(
      builder: (context, checkinpro, child) {
        checkinpro.loadAllData(user_devid);
        roomInfo = rmpro.getList();
        List<CheckIn> ciList = checkinpro.checkinList;
        return Column(children: [
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
                            onTap: () {
                              checkinpro.updateData(user_devid,
                                  ciList[index].timeIn, Timestamp.now());
                              print(index);
                              print(ciList[index].deviceID);
                              print(ciList[index].room);
                              final indexRoom = roomInfo.indexWhere((element) =>
                                  element.name == ciList[index].room);
                              roomsDB.updateData(
                                  ciList[index].room,
                                  roomInfo[indexRoom].capacity,
                                  roomInfo[indexRoom].available + 1);
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
            ),
          ],
          //Spacer(),
          GestureDetector(
            onTap: _scanQR,
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

class BarcodeScanner {
  static const CameraAccessDenied = 'PERMISSION_NOT_GRANTED';
  static const MethodChannel _channel =
      const MethodChannel('com.appletreesoftware.barcode_scan');
  static Future<String> scan() async => await _channel.invokeMethod('scan');
}
