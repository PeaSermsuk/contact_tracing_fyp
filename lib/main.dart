import 'package:contact_tracing_fyp/providers/roomuse_provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'database/rooms_db.dart';
import 'widgets.dart';
import 'providers/checkin_provider.dart';
//import 'settings_tab.dart';
import 'services/user_device.dart';
import 'intro_screen.dart';

//String user_devid;
Future<void> initDeviceID() async {
  await DeviceId.getID.then((value) {
    assigned_devid = value;
    print("value:$value");
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDeviceID();
  runApp(App());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      home: new Splash(),
    ); */
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return RoomUseProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return CheckInProvider();
        })
      ],
      child: MaterialApp(
        home: new Splash(),
        routes: {
          "/backhome": (context) => MyStatefulWidget(),
        },
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _seen = (prefs.getString('personalID'));

    if (_seen != null) {
      /*Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyStatefulWidget()));*/
      user_devid = _seen;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => MyStatefulWidget(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    } else {
      //await prefs.setBool('seen', true);
      /*Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroScreen()));*/
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => IntroScreen(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print('FlutterFire Init Error');
          return SomethingWentWrong();
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //if (user_devid != null) {
            print('FlutterFire Loaded');
            print("After $user_devid");
            return MyApp();
          //}
        }
        // Otherwise, show something whilst waiting for initialization to complete
        print('FlutterFire Loading');
        return Loading();
      },
    );
  }
}
/*
class GetDeviceID extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final String getDeviceID = UserDevice.deviceInfo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDeviceID,
      builder: (BuildContext context, AsyncSnapshot snap) {
        // do nothing...
        if (snap.hasData) {
          return MyApp();
        } else {
          //return new CircularProgressIndicator();
          return Loading();
        }
      },
    );
  }
}
*/