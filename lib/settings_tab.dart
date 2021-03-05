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
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 25)),
        ListTile(
          title: Text('College CID', style: TextStyle(fontSize: 18)),
          // The Material switch has a platform adaptive constructor.
          trailing: Text('00000000', style: TextStyle(fontSize: 18)),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Bluetooth', style: TextStyle(fontSize: 18)),
          // The Material switch has a platform adaptive constructor.
          trailing: Switch.adaptive(
            value: switch1,
            onChanged: (value) => setState(() => switch1 = value),
          ),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Location Services', style: TextStyle(fontSize: 18)),
          trailing: Switch.adaptive(
            value: switch2,
            onChanged: (value) => setState(() => switch2 = value),
          ),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Notifications', style: TextStyle(fontSize: 18)),
          trailing: Switch.adaptive(
            value: switch3,
            onChanged: (value) => setState(() => switch3 = value),
          ),
          tileColor: Colors.white,
        ),
      ],
    );
  }
}