import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'widgets.dart';
import 'settings_tab.dart';


void main() {
  var a = Room();
  var b = Room();
  a.roomNo = 10;
  a.roomName = 'Alpha';
  a.printRoom();
  b.roomNo = 11;
  b.roomName = 'Beta';
  b.printRoom();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class Room {
  int roomNo;
  String roomName;

  void printRoom() {
    print('Room number is $roomNo.');
    print('Room name is $roomName.');
  }
}

//void main() => runApp(MyApp());

// This was NOT used previously, just here for reference
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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
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
          return MyStatefulWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading');
        return Loading();
      },
    );
  }
}

// BELOW was used PREVIOUSLY
/*class MyApp extends StatelessWidget {
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
}*/

