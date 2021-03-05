import 'package:flutter/material.dart';

import 'widgets.dart';

class TimetableTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _TimetableTabState createState() => _TimetableTabState();
}

class _TimetableTabState extends State<TimetableTab> {

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //padding: EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //decoration: BoxDecoration(
        //  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
        //),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
              child: Icon(
                Icons.arrow_left,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Expanded(
              child: Text(
                'Monday',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: 20,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
              child: Icon(
                Icons.arrow_right,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        // alignment: Alignment.bottomCenter,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
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



      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '09:00',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '10:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '11:00',
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
                'CAGB 761',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '12:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '13:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '14:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '15:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '16:00',
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
                'CAGB 309',
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
      ),Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '17:00',
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
                'CAGB 309',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '18:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '19:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '20:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '21:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '22:00',
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
                '',
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '23:00',
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
                '',
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
      ),
    ]);
  }
}
