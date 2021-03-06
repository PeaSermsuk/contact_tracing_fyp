import 'package:flutter/material.dart';

import 'widgets.dart';

class SearchTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final List<String> entries = <String>[
    'CAGB 200',
    'CAGB 202A',
    'CAGB 202B',
    'CAGB 202C',
    'CAGB 300',
    'CAGB 309',
    'CAGB 310',
    'CAGB 640',
    'CAGB 641',
    'CAGB 642',
    'CAGB 649',
    'CAGB 664',
    'CAGB 751',
    'CAGB 752',
    'CAGB 761'
  ];

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //padding: EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //decoration: BoxDecoration(
        //  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
        //),
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          //border: Border(bottom: BorderSide(color: Colors.grey))
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            ),
            Expanded(
              child: Text(
                'Search...',
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1,
                  fontSize: 20,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // alignment: Alignment.bottomCenter,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey), bottom: BorderSide(color: Colors.grey))
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
                  fontSize: 15,
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
                  fontSize: 15,
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
                  fontSize: 15,
                  color: Colors.grey,
                  //fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        // alignment: Alignment.bottomCenter,
      ),



/*      Container(
        child:
        ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),*/
    ]);
  }
}
