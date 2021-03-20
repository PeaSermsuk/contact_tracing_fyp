import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

import 'widgets.dart';
import 'search_tab.dart';

class RoomSelectPage extends StatefulWidget {
  @override
  _RoomSelectPageState createState() => _RoomSelectPageState();
}

class _RoomSelectPageState extends State<RoomSelectPage> {

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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
              Navigator.pop(context);
            },
          //onPressed: () {
          //  Navigator.pop(context);
          //},
        ),
        //leading: Icon(
        //  Icons.arrow_back_ios,
        //  color: Colors.black,
        //  ),
        title: Text(
          'SELECT ROOM',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 1.5),
        itemCount: _roomInfo.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: null,
            child: Container(
              height: 45,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                _roomInfo[index].name,
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black,
                  ),
                ),
            ),
          );
        },
      ),
      //body: Container(
      //  child: Text('Hi')
      //),
    );
  }
}
