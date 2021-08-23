import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/controllers/overviewcontroller.dart';
import 'package:letzswap_dashboard/models/overviewmodel/userchartmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
class UserChart extends StatefulWidget {
  const UserChart({ Key? key }) : super(key: key);

  @override
  _UserChartState createState() => _UserChartState();
}

class _UserChartState extends State<UserChart> {
    SigninModel? token;
    late Future<UserChartModel> _futureChart;
    late UserChartVm data;
  @override
  void initState() {
    setState(() {
      gettoken();
      
    });

    super.initState();
  }
  

  gettoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? newtoken = sharedPreferences.getString("token");
    setState(() {
      token = SigninModel.fromJsonModel(jsonDecode(newtoken!));
    });
     _futureChart=OverViewController().getUserChart(token!.result.accessToken);
    _futureChart.then((value) => 
    data=value.result.map((e) => new UserChartVm(activeusers: e.activeusers, inactiveuser: e.inactiveuser, totalusers: e.totalusers)).first
    );
  }
  @override
  Widget build(BuildContext context) {
       return Container(
      height: 350,
      decoration: BoxDecoration(color: colorChartDownloadMain),
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionDatas,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                      "12"  ,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: secondaryColor,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: Text('Total Downloads',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Positioned(
              bottom: 30,
              left: 20,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: bgColor,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Active Users 12',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
          Positioned(
              bottom: 5,
              left: 20,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: secondaryColor,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('In-Active Users 12',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ))
        ],
      ),
    );
  }
}

// class Chart extends StatelessWidget {
//   const Chart({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
   
//   }
// }

List<PieChartSectionData> paiChartSelectionDatas = [
  PieChartSectionData(
    color: secondaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: bgColor,
    value: 20,
    showTitle: false,
    radius: 22,
  ),
];
