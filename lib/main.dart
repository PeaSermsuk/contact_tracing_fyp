import 'package:contact_tracing_fyp/providers/roomuse_provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/rooms_db.dart';
import 'widgets.dart';
import 'settings_tab.dart';

/*void initList() async {
  var rmdb = RoomsDB();
  roomInfo = await rmdb.getAllData();
  roomInfoSearch = roomInfo;
//  loading = 0;
//  setState(() {});
}*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        })
      ],
      child: MaterialApp(
        home: new Splash(),
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
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      /*Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyStatefulWidget()));*/
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => MyStatefulWidget(),
          transitionDuration: Duration(seconds: 0),
        ),
      );
    } else {
      await prefs.setBool('seen', true);
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
          print('Error');
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print('Loaded');
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading');
        return Loading();
      },
    );
  }
}
