import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/screens/users/usersscreen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: bgColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/logo_blue.png"),
            ),
            DrawerListTile(
              title: "Overview",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Users",
              svgSrc: "assets/images/profile1.png",
              press: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen()));


              },
            ),
            DrawerListTile(
              title: "Products",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Documents",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Store",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
              DrawerListTile(
              title: "Category",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
            
//             ExpansionTile(
//   title: Text(
//      "Category",
//       style: TextStyle(fontWeight: FontWeight.w700),
//        //svgSrc: "assets/images/profile1.png",
//   ),
//   children: <Widget>[
//     ListTile(
//       title: Text(
//        "Main Categories",
//         style: TextStyle(fontWeight: FontWeight.w700),
//       ),
//     )
//   ],
// ),

                    
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/images/profile1.png",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        svgSrc,
        color: secondaryColor,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: secondaryColor),
      ),
    );
  }
}
