import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  runApp(MyApp());
}

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
          //initList();
          return MyStatefulWidget();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print('Loading');
        return Loading();
      },
    );
  }
}
