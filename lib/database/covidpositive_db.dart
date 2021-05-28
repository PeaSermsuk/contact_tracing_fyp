import 'package:contact_tracing_fyp/database/checkin_db.dart';
//import 'package:contact_tracing_fyp/models/covidpositive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_tracing_fyp/database/persontimetable_db.dart';
import 'package:contact_tracing_fyp/database/riskpersons_db.dart';
import 'package:contact_tracing_fyp/database/timetable_db.dart';
import 'package:contact_tracing_fyp/models/checkin.dart';
import 'package:contact_tracing_fyp/models/persontimetable.dart';

class CovidPositiveDB {
  CovidPositiveDB();

  Future<void> addCovidPositive(String deviceid, Timestamp reportedTime) async {
    String dockey = deviceid + ' ' + reportedTime.toDate().toString();
    var cpref =
        FirebaseFirestore.instance.collection("covidpositive").doc(dockey);
    return cpref
        .set({
          "deviceid": deviceid,
          "infecteddate": reportedTime,
        })
        .then((value) => print("COVID-19 Case Added"))
        .catchError((error) => print("Failed to add COVID-19 Case: $error"));
  }

  void handleCovidPositive(String deviceid, Timestamp reportedTime) async {
    var riskpersonsDB = RiskPersonsDB();

    //set covid-positive as risk person with riskstatus='P'
    riskpersonsDB.addData(deviceid, reportedTime, 'P', 'Test positive');

    //handle Timetable Risk
    await handleTimetableRisk(deviceid, reportedTime);
    //handle Checkin Risk
    await handleCheckinRisk(deviceid, reportedTime);
  }

  void handleCheckinRisk(String deviceid, Timestamp reportedTime) async {
    String risktype;
    var checkinDB = CheckInDB();
    List<CheckIn> checkinRiskList = [];
    List<CheckIn> highriskCheckin = [];
    List<CheckIn> lowriskCheckin = [];

    var fdate = reportedTime.toDate().subtract(new Duration(days: 14));
    Timestamp stdate = Timestamp.fromDate(fdate);
    // get all checkin rooms of covid-positive person 14 days earlier
    checkinRiskList =
        await checkinDB.getCheckinRoomRisk(deviceid, stdate, reportedTime);
    for (var cr in checkinRiskList) {
      // seperate high risk and low risk
      // high risk => roomsize < 15
      if (cr.roomsize < 15) {
        highriskCheckin.add(cr);
      } else {
        lowriskCheckin.add(cr);
      }
    }
    // perform lowRisk-checkin from lowriskCheckin list
    // add riskpersons who checkin the same room&time of covidpositive person
    risktype = 'L';
    for (var cr in lowriskCheckin) {
      await addCheckinRiskPersons(
          risktype, deviceid, reportedTime, cr.room, cr.timeIn, cr.timeOut);
    }
    // perform highRisk-checkin from highriskCheckin list
    // add riskpersons who checkin the same room&time of covidpositive person
    risktype = 'H';
    for (var cr in highriskCheckin) {
      await addCheckinRiskPersons(
          risktype, deviceid, reportedTime, cr.room, cr.timeIn, cr.timeOut);
    }
  }

  void addCheckinRiskPersons(
      String risktype,
      String cvposid,
      Timestamp reportedTime,
      String room,
      Timestamp timeIn,
      Timestamp timeOut) async {
    DateTime cpstime, cpetime, rpstime, rpetime;
    String cause;
    var checkinDB = CheckInDB();
    var riskpersonsDB = RiskPersonsDB();
    // get date from timeIn (timeIn -> checkin date-time of covid-positive person)
    int yy = timeIn.toDate().year;
    int mm = timeIn.toDate().month;
    int dd = timeIn.toDate().day;
    // create new sttime (Timestamp) to represent checkin date at 00:00
    Timestamp sttime = Timestamp.fromDate(DateTime(yy, mm, dd, 0, 0, 0));

    List<CheckIn> checkinRiskList = [];
    // get all risk persons who checkin to the same room of covid-positive person
    // start from 00:00 of that day to covid-positive's checkout time (timeOut)
    checkinRiskList = await checkinDB.getRiskPersonsCheckinRoom(
        cvposid, room, sttime, timeOut);
    cpstime = timeIn.toDate(); // covidpositive-person's checkin time
    cpetime = timeOut.toDate(); // covidpositive-person's checkout time
    for (var cr in checkinRiskList) {
      // check whether risk-person's checkin time overlap with covid-positive's checkin time
      rpstime = cr.timeIn.toDate(); // risk-person's checkin time
      rpetime = cr.timeOut.toDate(); // risk-person's checkout time
      if (cpstime.isBefore(rpetime) && rpstime.isBefore(cpetime)) {
        if (risktype == 'H') {
          cause = 'High Risk - Checkin:';
        } else {
          cause = 'Low Risk - Checkin:';
        }
        cause = cause + room + ' ' + cr.timeIn.toDate().toString();
//        print(cr.deviceID + ' ' + risktype + ' ' + cause);
        // insert to riskpersons collection
        await riskpersonsDB.setData(cr.deviceID, reportedTime, risktype, cause);
      }
    }
  }

  void handleTimetableRisk(String deviceid, Timestamp reportedTime) async {
    var ptimetableDB = PersonTimeTableDB();
    var riskpersonsDB = RiskPersonsDB();
    String cause;
    List<PersonTimeTable> pttList = [];
    List<PersonTimeTable> ptRiskList = [];
    List _days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    // get timetable of covid-positive person
    pttList = await ptimetableDB.getAllData(deviceid);
    for (var pt in pttList) {
      // get all risk persons who have timetable the same room&day&hour as covid-positive person
      ptRiskList = await ptimetableDB.getRiskPersonsfromTimeTable(
          deviceid, pt.day, pt.hour, pt.roomName);
      for (var rt in ptRiskList) {
        // prepare data for risk person
        cause = 'Low Risk - Timetable: ';
        cause = cause + _days[rt.day] + '-' + rt.hour.toString() + ':00';
        // insert to riskpersons collection
//        print(rt.devid + ' ' + cause);
        await riskpersonsDB.setData(rt.devid, reportedTime, 'L', cause);
      }
    }
  }
}
