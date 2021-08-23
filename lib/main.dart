import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:letzswap_dashboard/screens/signin/signin.dart';
import 'package:provider/provider.dart';

import 'controllers/MenuController.dart';

void main() async {
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,   
        textTheme: textTheme(),
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white),
        canvasColor:  bgColor,
          unselectedWidgetColor:Colors.grey[600]  
      ),
      // home: DashboardScreen()

      // home: MultiProvider(
      //   providers: [
      //     // ChangeNotifierProvider(
      //     //   create: (context) => MenuController(),
      //     // ),
      //   ],
      //   child: 
       home:SigninDashboard(),
      
    );
  }
}
TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: secondaryColor),
    bodyText2: TextStyle(color: Colors.grey[600] ),
    
  );
}
