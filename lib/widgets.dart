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
            onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthPage()),
                )),
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

class IntroScreen extends StatelessWidget {
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
}
