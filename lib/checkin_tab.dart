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
      Container(
        padding:
            EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //color: Colors.white,
        decoration: BoxDecoration(
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
        ),
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
        // alignment: Alignment.bottomCenter,
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
      Spacer(),
      GestureDetector(
        onTap: null,
        child: Container(
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
