import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/user_device.dart';
import 'database/riskpersons_db.dart';
import 'widgets.dart';

class IntroScreen extends StatelessWidget {
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
                  riskpersonsDB.addNewUserData(
                      myController.text, rpdate, 'N', '[]');
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
}
