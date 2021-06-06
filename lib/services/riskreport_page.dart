import 'package:contact_tracing_fyp/models/riskdetail.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracing_fyp/models/riskpersons.dart';
import 'package:flutter/widgets.dart';

class RiskReportPage extends StatefulWidget {
  final RiskPersons riskp;
  const RiskReportPage({Key key, @required this.riskp}) : super(key: key);
  @override
  _RiskReportPageState createState() => _RiskReportPageState();
}

class _RiskReportPageState extends State<RiskReportPage> {
  @override
  Widget build(BuildContext context) {
    final rp = widget.riskp;
    String rkcode;

    // convert json-string to list<RiskDetail>
    List<RiskDetail> riskList = riskDetailFromJson(rp.cause);
    for (var rl in riskList) {
      if (rl.riskType == 'P') {
        rl.riskType = '3';
      } else if (rl.riskType == 'H') {
        rl.riskType = '2';
      } else if (rl.riskType == 'L') {
        rl.riskType = '1';
      } else if (rl.riskType == 'N') {
        rl.riskType = '0';
      }
    }
    riskList.sort((a, b) => -(a.reportDate.toString() + a.riskType)
        .compareTo((b.reportDate.toString() + b.riskType)));
    var noItem = riskList.length;

    return Scaffold(
        appBar: AppBar(
          title: Text("Risk Notification"),
        ),
        body: ListView.builder(
          itemCount: noItem,
          itemBuilder: (context, int index) {
            RiskDetail rd = riskList[index];
            String rtype = rd.riskType;
            var clr;
            var riskname;
            switch (rtype) {
              case '3': // 'P'
                {
                  riskname = 'Positive';
                  clr = Colors.black87;
                }
                break;
              case '2': // 'H'
                {
                  riskname = 'High Risk';
                  clr = Colors.red;
                }
                break;
              case '1': // 'L'
                {
                  riskname = 'Low Risk';
                  //           clr = Colors.yellow[600];
                  clr = Colors.amber[600];
                }
                break;
              case '0': // 'N'
                {
                  riskname = 'Normal';
                  clr = Colors.blue;
                }
                break;
              default:
                {}
                break;
            }

            String rdate = rd.reportDate.toString();
            String rtext = rd.riskText;

            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundColor: clr,
                  child: FittedBox(
                    child: Text(riskname),
                  ),
                ),
                //    title: Text("Risk Cause: $rtext"),
                //     title: Text(rtext),
                title: Text(rtext, style: TextStyle(color: clr)),
                subtitle: Text("Notify: $rdate"),
              ),
            );
          },
        ));
  }
}
