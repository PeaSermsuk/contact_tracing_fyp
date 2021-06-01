import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/providers/covidpositive_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'services/user_device.dart';
import 'report_page.dart';
import 'widgets.dart';

class HealthPage extends StatefulWidget {
  static const routeName = '/healthPage';
  static const title = 'CHECK IN';
  static const setIcon = Icon(Icons.qr_code_scanner_rounded);

  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  Timestamp reportedTime;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyStatefulWidget()));
            Navigator.popAndPushNamed(context, "/backhome");
          },
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 0.0),
            child: Text(
              'Self-Isolation Requirements:*',
              style: TextStyle(fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
          // COVID-19 Positive Box
          Container(
            //margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey))),
            child: Row(
              children: [
                Container(
                    child: Icon(
                  Icons.wc,
                  size: 100,
                  color: Colors.black,
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'COVID-19 Positive',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 5.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Self-isolate for 10 days.\nRemain in quarantine should symptoms still persist.',
                        style: TextStyle(fontSize: 16, height: 1.3),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          // High-Risk Contacts Box
          Container(
            //margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              children: [
                Container(
                    child: Icon(
                  Icons.wc,
                  size: 100,
                  color: Colors.red,
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'High-Risk Contacts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 5.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Self-isolate for 10 days.\nGet tested for COVID-19 if developed symptoms.',
                        style: TextStyle(fontSize: 16, height: 1.3),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          // Low-Risk Contacts Box
          Container(
            //margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              children: [
                Container(
                    child: Icon(
                  Icons.wc,
                  size: 100,
                  color: Colors.orange,
                )),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Low-Risk Contacts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, top: 5.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'No self-isolation required.\nMonitor symptoms for 10 days.\nGet tested if necessary.',
                        style: TextStyle(fontSize: 16, height: 1.3),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.centerLeft,
              child: Text('* for more information visit gov.uk')),
          GestureDetector(
              //onTap: _showMyDialog,
              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReportPage())),
              child: Container(
                margin:
                    EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                alignment: Alignment.center,
                child: Text('REPORT COVID-19\nTEST RESULT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    )),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
              ))
        ],
      ),
      //body: Container(
      //  child: Text('Hi')
      //),
    );
  }

  /*Future<void> _showMyDialog() async {
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
                  'Are you sure you want to report a positive COVID-19 test?',
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
                print('Reported COVID Positive ID: $user_devid');
                //test line               
                //reportedTime = Timestamp.fromDate(DateTime(2021, 5, 24, 10, 0));
                reportedTime = Timestamp.now();
                print('Reported COVID Time: $reportedTime');
                var cppro = CovidPositiveProvider();
                cppro.insertPositiveData(user_devid, reportedTime);
                Navigator.of(context).pop();
                alertToDismiss();
              },
            ),
          ],
        );
      },
    );
  }

  void alertToDismiss() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          //title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Thank you for reporting your positive COVID-19 test.\n\nPlease self-isolate for 10 days.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/
}
