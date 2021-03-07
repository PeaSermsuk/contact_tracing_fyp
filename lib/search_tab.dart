import 'package:flutter/material.dart';

import 'widgets.dart';

class SearchTab extends StatefulWidget {
  static const title = 'SEARCH';
  static const setIcon = Icon(Icons.search);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  List rooms = [
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
    'CAGB 761',
  ];

  double barFontSize = 16;
  double searchFontSize = 16;

  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //padding: EdgeInsets.only(left: 15.0, right: 30.0, bottom: 20.0, top: 20.0),
        //margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 0.0),
        //decoration: BoxDecoration(
        //  border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey)),
        //),
        //color: Colors.white,
        height: 45,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        alignment: Alignment.center,
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
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
          itemCount: rooms.length,
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
                      rooms[index],
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
                      '000',
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
                      '000',
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
