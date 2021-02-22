import 'package:flutter/material.dart';

import 'settings_tab.dart';

void main() => runApp(MyApp());

/*// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Contact Tracing App',
      home: MyStatefulWidget(),
      /*theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: const Color(0xEEEEEE),
      ),*/
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
//  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
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
  initState(){
    _title = 'CHECK IN';
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) {
        case 0: { _title = 'CHECK IN'; }
        break;
        case 1: { _title = 'SEARCH'; }
        break;
        case 2: { _title = 'TIMETABLE'; }
        break;
        case 3: {
          _title = 'SETTINGS';
//          Navigator.pop(context);
          Navigator.push<void>(context,
            MaterialPageRoute(builder: (context) => SettingsTab()));
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
            onPressed: null,
          ),
        ],
      ),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        //unselectedItemColor: const Color(0xFFEEEEEE),
        onTap: _onItemTapped,
      ),
    );
  }
}