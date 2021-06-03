String user_devid;
String assigned_devid;
/*
import 'package:device_id/device_id.dart';
import 'package:flutter/services.dart';

class UserDevice {
  String deviceid;
  String imei;
  String meid;

  UserDevice() {
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    deviceid = await DeviceId.getID;
    try {
      imei = await DeviceId.getIMEI;
      meid = await DeviceId.getMEID;
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
*/