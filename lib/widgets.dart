import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/providers/rooms_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkin_tab.dart';
import 'models/rooms.dart';
import 'search_tab.dart';
import 'settings_tab.dart';
import 'timetable_tab.dart';
import 'health_page.dart';
import 'services/user_device.dart';
import 'models/riskpersons.dart';
import 'database/riskpersons_db.dart';

//List<Rooms> roomInfo = [];
//List<Rooms> roomInfoSearch = [];

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
//  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _currentIndex = 0;
  List<Widget> _children;
  String _title;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'CHECK IN',
      style: optionStyle,
    ),
    Text(
      'SEARCH',
      style: optionStyle,
    ),
    Text(
      'TIMETABLE',
      style: optionStyle,
    ),
    Text(
      'SETTINGS',
      style: optionStyle,
    ),
  ];

  @override
  initState() {
    super.initState();
    //Provider.of<RoomProvider>(context, listen: false).initData();
    _children = [
      CheckInTab(),
      SearchTab(),
      TimetableTab(),
      SettingsTab(),
    ];
    _title = 'CHECK IN';
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      switch (index) {
        case 0:
          {
            _title = 'CHECK IN';
          }
          break;
        case 1:
          {
            _title = 'SEARCH';
          }
          break;
        case 2:
          {
            _title = 'TIMETABLE';
          }
          break;
        case 3:
          {
            _title = 'SETTINGS';
          }
          break;
      }
    });
  }

  @override
  void _stateUpdate() {
    setState(() {});
    print("refresh done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        /*leading: Icon(
          Icons.menu,
          color: Colors.black,
          ),*/
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: const Color(0xFFFF5555),
              size: 30,
            ),
            //onPressed: (() => Navigator.of(context).pushNamed(HealthPage.routeName).then((value) => setState(() {}))),
            /*onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthPage()),
                )),*/
            onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HealthPage()))
                .then((value) => _stateUpdate()),
          ),
        ],
      ),
      body: _children[_currentIndex],
      //body: Center(
      // child: _widgetOptions.elementAt(_selectedIndex),
      //),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_rounded),
            label: 'CHECK IN',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'SEARCH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'TIMETABLE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'SETTINGS',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        //unselectedItemColor: const Color(0xFFEEEEEE),
        onTap: _onItemTapped,
      ),
    );
  }
}

class SomethingWentWrong extends StatefulWidget {
  @override
  _SomethingWentWrongState createState() => _SomethingWentWrongState();
}

class _SomethingWentWrongState extends State<SomethingWentWrong> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong./n Please try again.',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Loading...',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

/*class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IntroScreen'),
      ),
      body: new Center(
        child: new Text('This is the IntroScreen'),
      ),
    );
  }
}*/

/*class IntroScreen extends StatelessWidget {
  TextEditingController myController = new TextEditingController();
  var riskpersonsDB = RiskPersonsDB();

  void addStringToSF(String cid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('personalID', cid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'TRACE IMPERIAL',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            //height: 45,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text(
              'Please enter your personal CID number:',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 15.0, bottom: 15.0),
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  //hintText: '00000000',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                onChanged: null),
          ),
          Container(
            width: 100,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff005A92),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0)),
            ),
            child: GestureDetector(
              onTap: () {
                Timestamp rpdate = Timestamp.now();
                if (myController.text != '') {
                  addStringToSF(myController.text);
                  user_devid = myController.text;
                  riskpersonsDB.addData(myController.text, rpdate, 'N', '');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                  );
                }
              },
              child: Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(height: 100.0),
        ],
      ),
    );
  }
}*/
