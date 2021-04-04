import 'package:contact_tracing_fyp/database/rooms_db.dart';
import 'package:contact_tracing_fyp/models/rooms.dart';
//import 'package:contact_tracing_fyp/providers/rooms_provider.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:async';

//import 'widgets.dart';

class SearchTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  double barFontSize = 16;
  double searchFontSize = 16;
  List<Rooms> roomInfo = [];
  List<Rooms> roomInfoSearch = [];
  @override
  void initState() {
    super.initState();
    this.initList();
  }

  void initList() async {
    var rmdb = RoomsDB();
    roomInfo = await rmdb.getAllData();
    /*for (var rm in roomInfo) {
      roomInfoSearch.add(rm);
    }*/
    roomInfoSearch = roomInfo;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
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
      ),
      Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
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
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(height: 1.0),
          itemCount: roomInfoSearch.length,
          itemBuilder: (context, index) {
            return Container(
              height: 45,
              alignment: Alignment.center,
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
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      )
    ]);
  }
}
