import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/controllers/MenuController.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/helpers/adaptiveScaffold.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/tokenmodels/tokenmodel.dart';
import 'package:letzswap_dashboard/models/usermodel/usermodel.dart';
import 'package:letzswap_dashboard/screens/Delivery/deliveryscreen.dart';
import 'package:letzswap_dashboard/screens/bookmarks/bookmarksscreeen.dart';
import 'package:letzswap_dashboard/screens/categories/categoriesscreen.dart';
 
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:letzswap_dashboard/screens/devicelocation/devicelocationscreen.dart';
import 'package:letzswap_dashboard/screens/exchange/exchangescreen.dart';
import 'package:letzswap_dashboard/screens/feedback/feedbackscreen.dart';
import 'package:letzswap_dashboard/screens/overview/overview.dart';
import 'package:letzswap_dashboard/screens/products/productscreendashboard.dart';
import 'package:letzswap_dashboard/screens/users/usersscreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  @override
 Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: const Text('Dashboard App'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
            },
            child: const Text('Sign Out'),
          ),
        )
      ],
      currentIndex: _pageIndex,
      destinations: const [
        AdaptiveScaffoldDestination(title: 'Overview', icon: Icons.home),
        AdaptiveScaffoldDestination(title: 'Users', icon: Icons.supervised_user_circle),
        AdaptiveScaffoldDestination(title: 'Category', icon: Icons.category),
         AdaptiveScaffoldDestination(title: 'Bookmarks', icon: Icons.bookmark),
         AdaptiveScaffoldDestination(title: 'Product', icon: Icons.production_quantity_limits_sharp),
          AdaptiveScaffoldDestination(title: 'Exchange', icon: Icons.swap_vertical_circle),
           AdaptiveScaffoldDestination(title: 'DeviceLocation', icon: Icons.location_history),
            AdaptiveScaffoldDestination(title: 'Delivery', icon: Icons.local_shipping),
             AdaptiveScaffoldDestination(title: 'FeedBack', icon: Icons.feedback),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
        });
      },
      // floatingActionButton:
      //     _hasFloatingActionButton ? _buildFab(context) : null,
    );
  }

  // bool get _hasFloatingActionButton {
  //   if (_pageIndex == 2) return false;
  //   return true;
  // }

  // FloatingActionButton _buildFab(BuildContext context) {
  //   return FloatingActionButton(
  //     child: const Icon(Icons.add),
  //     onPressed: () => _handleFabPressed(),
  //   );
  // }

  // void _handleFabPressed() {
  //   if (_pageIndex == 0) {
  //     showDialog<NewCategoryDialog>(
  //       context: context,
  //       builder: (context) => NewCategoryDialog(),
  //     );
  //     return;
  //   }

    // if (_pageIndex == 1) {
    //   showDialog<NewEntryDialog>(
    //     context: context,
    //     builder: (context) => NewEntryDialog(),
    //   );
    //   return;
    // }


  // Future<void> _handleSignOut() async {
  //   var shouldSignOut = await showDialog<bool>(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Are you sure you want to sign out?'),
  //       actions: [
  //         TextButton(
  //           child: const Text('No'),
  //           onPressed: () {
  //             Navigator.of(context).pop(false);
  //           },
  //         ),
  //         TextButton(
  //           child: const Text('Yes'),
  //           onPressed: () {
  //             Navigator.of(context).pop(true);
  //           },
  //         ),
  //       ],
  //     ),
  //   );

  //   if (!shouldSignOut) {
  //     return;
  //   }

  //   widget.onSignOut();
  // }

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      return OverviewScreen();
    }

    if (index == 1) {
      return UserScreen();
    }
    if (index == 2) {
      return CategoriesScreen();
    }
      if (index == 3) {
      return BookmarkScreen();
    }
      if (index == 4) {
      return ProductScreenDashboard();
    }
     if (index == 5) {
      return ExchangeScreen();
    }
     if (index == 6) {
      return DeviceLocationScreen();
    }
     if (index == 7) {
      return DeliveryScreen();
    }
     if (index == 8) {
      return FeedBackScreen();
    }


    return const Center(child: Text('Settings page'));
  }
  
}







  // Widget build(BuildContext context) {
  //   return
  //   //  Scaffold(
  //     //  key: context.read<MenuController>().scaffoldKey,
  //     // drawer: SideMenu(),
  //     // body: SafeArea(
  //       //child:
  //        Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //            if (Responsive.isDesktop(context))
  //             Expanded(
  //               // default flex = 1
  //               // and it takes 1/6 part of the screen
  //               child: SideMenu(),
  //             ),
  //           Expanded(
  //              flex: 5,
  //             child: SingleChildScrollView(
  //               padding: EdgeInsets.all(defaultPadding),
  //               child: Column(
  //                 children: [
  //                   // Header(),
  //                   SizedBox(height: defaultPadding),
  //                   Row(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Expanded(
  //                         flex: 5,
  //                         child: Column(
  //                           children: [
  //                                UserScreen(),
  //                        //CategoriesScreen(),
  //                         //ProductScreenDashboard(),
              
                
  //                             // MyFiles(),
  //                             // SizedBox(height: defaultPadding),
  //                             // // RecentFiles(),
  //                             // UserStatsChart(),
  //                             // SizedBox(height: defaultPadding),
  //                             // RevenueChart(),
  //                             // SizedBox(height: defaultPadding),
  //                             // Text('Top Visitors'),
  //                             // SizedBox(height: defaultPadding),
  //                             // TopvisitorSilder(),
  //                             // if (Responsive.isMobile(context))
  //                             //   SizedBox(height: defaultPadding),
  //                             // if (Responsive.isMobile(context)) StarageDetails(),
  //                           ],
  //                         ),
  //                       ),
  //                       // if (!Responsive.isMobile(context))
  //                       //   SizedBox(width: defaultPadding),
  //                       // // On Mobile means if the screen is less than 850 we dont want to show it
  //                       // if (!Responsive.isMobile(context))
  //                       //   Expanded(
  //                       //     flex: 2,
  //                       //     child: StarageDetails(),
  //                       //   ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //   //   ),
  //   // );
  // }
// }
