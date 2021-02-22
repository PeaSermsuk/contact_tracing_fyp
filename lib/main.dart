import 'package:flutter/material.dart';

import 'widgets.dart';
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

