import 'package:flutter/material.dart';

import 'widgets.dart';

class HealthPage extends StatefulWidget {
  static const title = 'CHECK IN';
  static const setIcon = Icon(Icons.qr_code_scanner_rounded);

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton (
          icon:
          Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        //leading: Icon(
        //  Icons.arrow_back_ios,
        //  color: Colors.black,
        //  ),
        title: Text(
          'HEALTH',
          style: TextStyle(
            color: Colors.black,
            ),
          ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        
      )
    );
  }
}