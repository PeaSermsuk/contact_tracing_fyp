import 'package:flutter/material.dart';

import 'widgets.dart';

class SettingsTab extends StatefulWidget {
  static const title = 'SETTINGS';
  static const setIcon = Icon(Icons.settings);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var switch1 = true;
  var switch2 = true;
  var switch3 = true;

  Widget build(BuildContext context) {

    double boxHeight = 48;

    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 25)),
        Container(
          height: boxHeight,
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
              Text('College CID', style: TextStyle(fontSize: 16)),
              Spacer(),
              Text('00000000', style: TextStyle(fontSize: 16))
            ],
          ),
          //title: Text('College CID', style: TextStyle(fontSize: 16)),
          // The Material switch has a platform adaptive constructor.
          //trailing: Text('00000000', style: TextStyle(fontSize: 16)),
          //tileColor: Colors.white,
        ),
        Container(
          height: boxHeight,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Text('Bluetooth', style: TextStyle(fontSize: 16)),
              Spacer(),
              Switch.adaptive(
                value: switch1,
                onChanged: (value) => setState(() => switch1 = value),
              ),
            ],
          ),
        ),
        Container(
          height: boxHeight,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Text('Location Services', style: TextStyle(fontSize: 16)),
              Spacer(),
              Switch.adaptive(
                value: switch2,
                onChanged: (value) => setState(() => switch2 = value),
              ),
            ],
          ),
        ),
        Container(
          height: boxHeight,
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            children: [
              Text('Notifications', style: TextStyle(fontSize: 16)),
              Spacer(),
              Switch.adaptive(
                value: switch3,
                onChanged: (value) => setState(() => switch3 = value),
              ),
            ],
          ),
        ),
        /*ListTile(
          title: Text('Bluetooth', style: TextStyle(fontSize: 16)),
          // The Material switch has a platform adaptive constructor.
          trailing: Switch.adaptive(
            value: switch1,
            onChanged: (value) => setState(() => switch1 = value),
          ),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Location Services', style: TextStyle(fontSize: 16)),
          trailing: Switch.adaptive(
            value: switch2,
            onChanged: (value) => setState(() => switch2 = value),
          ),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Notifications', style: TextStyle(fontSize: 16)),
          trailing: Switch.adaptive(
            value: switch3,
            onChanged: (value) => setState(() => switch3 = value),
          ),
          tileColor: Colors.white,
        ),*/
      ],
    );
  }
}
