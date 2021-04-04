import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
import 'package:contact_tracing_fyp/providers/rooms_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

import 'widgets.dart';

class SearchTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {

  double barFontSize = 16;
  double searchFontSize = 16;
  //List<Rooms> roomInfo = [];
  //var roomInfo = RoomsDB().getAllData();
  //List<Rooms> roomInfoSearch = roomInfo;
  //List<Rooms> roomInfo  = await RoomsDB().getAllData();

  //List<Rooms> roomInfo = RoomsDB().getAllData();

  //Future<List<Rooms>> fetchList = RoomsDB().getAllData();
  //List<Rooms> roomInfo = await fetchList;

  /*Future getRooms() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qs = await firestore.collection("rooms").get();
    return qs.docs;
  }*/

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //padding: EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //decoration: BoxDecoration(
        //  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
        //),
        //color: Colors.white,
        //height: 45,
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                color: Colors.grey.shade600,
                size: 22,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    onChanged: (text) {
                      text = text.toLowerCase();
                      setState(() {
                        roomInfoSearch = roomInfo.where((room) {
                          var roomName = room.name.toLowerCase();
                          return roomName.contains(text);
                        }).toList();
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        // alignment: Alignment.bottomCenter,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'LOCATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: barFontSize,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'CAPACITY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: barFontSize,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                'AVAILABLE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontSize: barFontSize,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // alignment: Alignment.bottomCenter,
      ),
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: roomInfoSearch.length,
          itemBuilder: (context, index) {
            return Container(
              height: 45,
              alignment: Alignment.center,
              //padding: EdgeInsets.only(bottom: 14.5, top: 14.5),
              //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      roomInfoSearch[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: searchFontSize,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      roomInfoSearch[index].capacity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: searchFontSize,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      roomInfoSearch[index].available.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1,
                        fontSize: searchFontSize,
                        color: Colors.black,
                        //fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              // alignment: Alignment.bottomCenter,
            );
          },
        ),
      )
    ]);
  }
}

/*class RoomInfo {
  List<Info> _roomInfo = [
    Info(name: 'CAGB 200', capacity: 200, available: 200),
    Info(name: 'CAGB 202A', capacity: 200, available: 200),
    Info(name: 'CAGB 202B', capacity: 200, available: 200),
    Info(name: 'CAGB 202C', capacity: 200, available: 200),
    Info(name: 'CAGB 300', capacity: 200, available: 200),
    Info(name: 'CAGB 309', capacity: 200, available: 200),
    Info(name: 'CAGB 310', capacity: 200, available: 200),
    Info(name: 'CAGB 640', capacity: 200, available: 200),
    Info(name: 'CAGB 641', capacity: 200, available: 200),
    Info(name: 'CAGB 642', capacity: 200, available: 200),
    Info(name: 'CAGB 649', capacity: 200, available: 200),
    Info(name: 'CAGB 664', capacity: 200, available: 200),
    Info(name: 'CAGB 751', capacity: 200, available: 200),
    Info(name: 'CAGB 752', capacity: 200, available: 200),
    Info(name: 'CAGB 761', capacity: 200, available: 200),
  ];
}*/

List<Info> roomInfo = [
  Info(name: 'CAGB 200', capacity: 200, available: 200),
  Info(name: 'CAGB 202A', capacity: 250, available: 200),
  Info(name: 'CAGB 202B', capacity: 200, available: 200),
  Info(name: 'CAGB 202C', capacity: 200, available: 200),
  Info(name: 'CAGB 300', capacity: 200, available: 200),
  Info(name: 'CAGB 309', capacity: 200, available: 200),
  Info(name: 'CAGB 310', capacity: 200, available: 200),
  Info(name: 'CAGB 640', capacity: 200, available: 200),
  Info(name: 'CAGB 641', capacity: 200, available: 200),
  Info(name: 'CAGB 642', capacity: 200, available: 200),
  Info(name: 'CAGB 649', capacity: 200, available: 200),
  Info(name: 'CAGB 664', capacity: 200, available: 200),
  Info(name: 'CAGB 751', capacity: 200, available: 200),
  Info(name: 'CAGB 752', capacity: 200, available: 200),
  Info(name: 'CAGB 761', capacity: 200, available: 200),
];
List<Info> roomInfoSearch = [
  Info(name: 'CAGB 200', capacity: 200, available: 200),
  Info(name: 'CAGB 202A', capacity: 250, available: 200),
  Info(name: 'CAGB 202B', capacity: 200, available: 200),
  Info(name: 'CAGB 202C', capacity: 200, available: 200),
  Info(name: 'CAGB 300', capacity: 200, available: 200),
  Info(name: 'CAGB 309', capacity: 200, available: 200),
  Info(name: 'CAGB 310', capacity: 200, available: 200),
  Info(name: 'CAGB 640', capacity: 200, available: 200),
  Info(name: 'CAGB 641', capacity: 200, available: 200),
  Info(name: 'CAGB 642', capacity: 200, available: 200),
  Info(name: 'CAGB 649', capacity: 200, available: 200),
  Info(name: 'CAGB 664', capacity: 200, available: 200),
  Info(name: 'CAGB 751', capacity: 200, available: 200),
  Info(name: 'CAGB 752', capacity: 200, available: 200),
  Info(name: 'CAGB 761', capacity: 200, available: 200),
];

class Info {
  String name;
  int capacity;
  int available;
  Info({this.name, this.capacity, this.available});
}
