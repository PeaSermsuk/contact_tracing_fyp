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
    print("in user Device ID: $deviceid");
    try {
      imei = await DeviceId.getIMEI;
      meid = await DeviceId.getMEID;
    } on PlatformException catch (e) {
      print(e.message);
    }
    print("in user IMEI: $imei");
    print("in user MEID: $meid");
  }

  Future<String> deviceInfo() async {
    deviceid = await DeviceId.getID;
    return deviceid;
  }

  String getDeviceID() => deviceid;
  String getImei() => imei;
  String getMeid() => meid;
}
