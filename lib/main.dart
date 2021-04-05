import 'package:contact_tracing_fyp/providers/rooms_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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
    /*return MaterialApp(
      home: MyStatefulWidget(),
    );*/
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return RoomProvider();
        })
      ],
      child: MaterialApp(
        home: MyStatefulWidget(),
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
