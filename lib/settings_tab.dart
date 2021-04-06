import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
              Text('Device ID', style: TextStyle(fontSize: 16)),
              Spacer(),
              Text('XXXXXXXXXX', style: TextStyle(fontSize: 16)),
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
              Text('XXXXXXXXXX', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        /*Container(
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
        Padding(padding: EdgeInsets.only(top: 25)),
        GestureDetector(
          onTap: _logoutDialog,
          child: Container(
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
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Text('Log Out',
                style: TextStyle(fontSize: 16, color: Colors.red)),
          ),
        ),*/
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

    Future<void> _logoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Are you sure you want to log out?',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'No',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Yes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
