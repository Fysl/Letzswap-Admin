import 'package:flutter/material.dart';

import '../constants.dart';

bool _isLargeScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 960.0;
}

bool _isMediumScreen(BuildContext context) {
  return MediaQuery.of(context).size.width > 640.0;
}

/// See bottomNavigationBarItem or NavigationRailDestination
class AdaptiveScaffoldDestination {
  final String title;
  final IconData icon;

  const AdaptiveScaffoldDestination({
    required this.title,
    required this.icon,
  });
}

/// A widget that adapts to the current display size, displaying a [Drawer],
/// [NavigationRail], or [BottomNavigationBar]. Navigation destinations are
/// defined in the [destinations] parameter.
class AdaptiveScaffold extends StatefulWidget {
  final Widget title;
  final List<Widget> actions;
  final Widget body;
  final int currentIndex;
  final List<AdaptiveScaffoldDestination> destinations;
  final ValueChanged<int> onNavigationIndexChange;
  // final FloatingActionButton floatingActionButton;

  const AdaptiveScaffold({
    required this.title,
    required this.body,
    this.actions = const [],
    required this.currentIndex,
    required this.destinations,
   required this.onNavigationIndexChange,
    // this.floatingActionButton,
  });

  @override
  _AdaptiveScaffoldState createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  @override
  Widget build(BuildContext context) {
    // Show a Drawer
    if (_isLargeScreen(context)) {
      return Row(
        children: [
          Drawer(
            child: Container(
             // width: 400,
               color: bgColor,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Center(
                     child: Image.asset("assets/images/logo_blue.png"),
                    ),
                  ),
                  for (var d in widget.destinations)
                    ListTile(
                     hoverColor:colormain.withOpacity(0.5) ,
                     focusColor: colormain,
                     selectedTileColor: colormain,

                       horizontalTitleGap: 0.0,
                      leading: Icon(d.icon),
                      title: Text(d.title,
                      style: TextStyle(color: secondaryColor),
                      ),
                      selected:
                          widget.destinations.indexOf(d) == widget.currentIndex,
                      onTap: () => _destinationTapped(d),
                    ),
                ],
              ),
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor:bgColor,
                actions: widget.actions,
                 title: widget.title,
              ),
              body: widget.body,
              // floatingActionButton: widget.floatingActionButton,
            ),
          ),
        ],
      );
    }

    // Show a navigation rail
    if (_isMediumScreen(context)) {
      return Scaffold(
        appBar: AppBar(
          title: widget.title,
          actions: widget.actions,
        ),
        body: Row(
          children: [
            NavigationRail(
             // leading: widget.floatingActionButton,
              destinations: [
                ...widget.destinations.map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    label: Text(d.title),
                  ),
                ),
              ],
              selectedIndex: widget.currentIndex,
              onDestinationSelected: widget.onNavigationIndexChange,
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: widget.body,
            ),
          ],
        ),
      );
    }

    // Show a bottom app bar
    return Scaffold(
      body: widget.body,
      appBar: AppBar(
       
        title: widget.title,
        actions: widget.actions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...widget.destinations.map(
            (d) => BottomNavigationBarItem(
              icon: Icon(d.icon),
              label: d.title,
            ),
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: widget.onNavigationIndexChange,
      ),
      //floatingActionButton: widget.floatingActionButton,
    );
  }

  void _destinationTapped(AdaptiveScaffoldDestination destination) {
    var idx = widget.destinations.indexOf(destination);
    if (idx != widget.currentIndex) {
      widget.onNavigationIndexChange(idx);
    }
  }
}