import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/responsive.dart';
import 'package:letzswap_dashboard/screens/overview/components/header.dart';
import 'package:letzswap_dashboard/screens/overview/components/my_files.dart';
import 'package:letzswap_dashboard/screens/overview/components/revenuechart.dart';
import 'package:letzswap_dashboard/screens/overview/components/storage_details.dart';
import 'package:letzswap_dashboard/screens/overview/components/topvisitorslide.dart';
import 'package:letzswap_dashboard/screens/overview/components/usersstatschart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({ Key? key }) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
 SigninModel? token;
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
  //  resulttoken=token!.result.accessToken;
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return            
    Row(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             if (Responsive.isDesktop(context))
               
            Expanded(
               flex: 5,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    //  Header(),
                    SizedBox(height: defaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [           
                              MyFiles( token:token!.result.accessToken),
                              SizedBox(height: defaultPadding),
                              // RecentFiles(),
                              UserStatsChart(),
                              SizedBox(height: defaultPadding),
                              RevenueChart(),
                              SizedBox(height: defaultPadding),
                              Text('Top Visitors'),
                              SizedBox(height: defaultPadding),
                              TopvisitorSilder(),
                              if (Responsive.isMobile(context))
                                SizedBox(height: defaultPadding),
                              if (Responsive.isMobile(context)) StarageDetails(),
                            ],
                          ),
                        ),
                        if (!Responsive.isMobile(context))
                          SizedBox(width: defaultPadding),
                        // On Mobile means if the screen is less than 850 we dont want to show it
                        if (!Responsive.isMobile(context))
                          Expanded(
                            flex: 2,
                            child: StarageDetails(),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        );
  }
}
 