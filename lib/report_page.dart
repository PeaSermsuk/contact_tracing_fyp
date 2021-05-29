import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/providers/covidpositive_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'services/user_device.dart';
import 'widgets.dart';

class ReportPage extends StatefulWidget {
  List<String> testResults = ['Positive', 'Negative', 'Inconclusive'];

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  Timestamp systemTime = Timestamp.now();
  // get date from timeIn (timeIn -> checkin date-time of covid-positive person)
  int yy = Timestamp.now().toDate().year;
  int mm = Timestamp.now().toDate().month;
  int dd = Timestamp.now().toDate().day;
  // create new sttime (Timestamp) to represent checkin date at 00:00
  Timestamp testedDate;
  String selectedValue;
  int selectedIndex;
  DateTime selectedDate;

  @override
  void initState() {
    testedDate = Timestamp.fromDate(DateTime(yy, mm, dd, 0, 0, 0));
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //leading: Icon(
        //  Icons.arrow_back_ios,
        //  color: Colors.black,
        //  ),
        title: Text(
          'REPORT COVID-19 TEST',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Test Result:',
              style: TextStyle(fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
          // COVID-19 Positive Box
          Container(
            height: 139.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                    top: BorderSide(color: Colors.grey, width: 1.0))),
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(height: 1.0, color: Colors.grey),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 45.0,
                    child: Row(
                      children: <Widget>[
                        Radio(
                            value: widget.testResults[index],
                            groupValue: selectedValue,
                            onChanged: (s) {
                              selectedValue = s;
                              selectedIndex = index;
                              setState(() {});
                              print(s);
                              print(index);
                            }),
                        Text(
                          widget.testResults[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Test Date:',
              style: TextStyle(fontSize: 16),
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 180.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0),
                    top: BorderSide(color: Colors.grey, width: 1.0))),
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime) => setState(() => {
                    selectedDate = dateTime,
                    testedDate = Timestamp.fromDate(selectedDate),
                    print(selectedDate),
                    print(testedDate),
                  }),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (selectedValue != null) {
                _showMyDialog();
              }
            },
            child: Container(
              height: 45.0,
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 1.0),
                      top: BorderSide(color: Colors.grey, width: 1.0))),
              child: Center(
                child: Text(
                  'Report',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      //body: Container(
      //  child: Text('Hi')
      //),
    );
  }

  Future<void> _showMyDialog() async {
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
                  'Are you sure you want to report the COVID-19 test?',
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
                var cppro = CovidPositiveProvider();
                if (selectedIndex == 0) {
                  print('Reported COVID Positive ID: $user_devid');
                  //test line
                  //testedDate = Timestamp.fromDate(DateTime(2021, 5, 24, 10, 0));
                  //testedDate = Timestamp.now();
                  print('Tested Time: $testedDate');
                  cppro.insertPositiveData(user_devid, testedDate, systemTime);
                } else {
                  cppro.insertNonPositiveData(user_devid, testedDate,
                      selectedValue, selectedIndex, systemTime);
                }
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
                  'Thank you for reporting your COVID-19 test result.',
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text(
                  'Dismiss',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  //Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
