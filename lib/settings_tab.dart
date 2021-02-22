import 'package:flutter/material.dart';

import 'widgets.dart';

class SettingsTab extends StatefulWidget {
  static const title = 'Settings';
  static const setIcon = Icon(Icons.settings);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var switch1 = false;
  var switch2 = true;
  var switch3 = true;

  Widget _buildList() {
    return ListView(
      children: [
        Padding(padding: EdgeInsets.only(top: 24)),
        ListTile(
          title: Text('College CID'),
          // The Material switch has a platform adaptive constructor.
          trailing: Switch.adaptive(
            value: switch1,
            onChanged: (value) => setState(() => switch1 = value),
          ),
        ),
        ListTile(
          title: Text('Bluetooth'),
          // The Material switch has a platform adaptive constructor.
          trailing: Switch.adaptive(
            value: switch1,
            onChanged: (value) => setState(() => switch1 = value),
          ),
        ),
        ListTile(
          title: Text('Location services'),
          trailing: Switch.adaptive(
            value: switch2,
            onChanged: (value) => setState(() => switch2 = value),
          ),
        ),
        ListTile(
          title: Text('Notifications'),
          trailing: Switch.adaptive(
            value: switch3,
            onChanged: (value) => setState(() => switch3 = value),
          ),
        ),
      ],
    );
  }

    // ===========================================================================
  // Non-shared code below because this tab uses different scaffolds.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(
    //    title: Text(SettingsTab.title),
    //  ),
      body: _buildList(),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
    );
  }
}