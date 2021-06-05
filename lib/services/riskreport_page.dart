import 'package:contact_tracing_fyp/models/riskdetail.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracing_fyp/models/riskpersons.dart';

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

    riskList.sort((a, b) =>
        a.reportDate.compareTo(b.reportDate) &
        -a.riskType.compareTo(b.riskType));
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
              case 'P':
                {
                  riskname = 'Positive';
                  clr = Colors.black87;
                }
                break;
              case 'N':
                {
                  riskname = 'Normal';
                  clr = Colors.blue;
                }
                break;
              case 'H':
                {
                  riskname = 'High Risk';
                  clr = Colors.red;
                }
                break;
              case 'L':
                {
                  riskname = 'Low Risk';
                  //           clr = Colors.yellow[600];
                  clr = Colors.amber[600];
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
