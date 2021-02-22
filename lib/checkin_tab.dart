import 'package:flutter/material.dart';

import 'widgets.dart';

class CheckInTab extends StatefulWidget {
  static const title = 'CHECK IN';
  static const setIcon = Icon(Icons.qr_code_scanner_rounded);

  @override
  _CheckInTabState createState() => _CheckInTabState();
}

class _CheckInTabState extends State<CheckInTab> {
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
        child: Text(
          'Currently checked in at:',
          style: TextStyle(
              height: 1,
              fontSize: 20,
              color: Colors.black,
              ),
        ),
        alignment: Alignment.topLeft,
      ),
      Container(
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        color: Colors.black,
        child: Text(
          'CAGB 200',
          style: TextStyle(
              height: 1,
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.bottomCenter,
      ),
      Expanded(
        child: (
          Container(
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
          )
        ),
      ),
      Container(
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.all(20.0),
        color: Colors.black,
        child: Text(
          'SCAN QR CODE',
          style: TextStyle(
              height: 1,
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.bottomCenter,
      )
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
