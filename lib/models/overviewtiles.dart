import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/controllers/overviewcontroller.dart';

import '../constants.dart';

class OverviewTiles {
  
  final String? title;

  final IconData? iconsrc;
  final Color? color;
  int? count;

  OverviewTiles({
    this.iconsrc,
    this.count,
    this.title,
    this.color,
  });
 
}

List demoMyFiles = [
  OverviewTiles(
      title: "Total Post",
      iconsrc: Icons.home_outlined,
      color: colorCard1,
      count: 10),
  OverviewTiles(
      title: "New Users",
      iconsrc: Icons.home_outlined,
      color: colorCard2,
      count: 203),
  OverviewTiles(
      title: "Total Swaps",
      iconsrc: Icons.home_outlined,
      color: colorCard3,
      count: 2500),
  OverviewTiles(
      title: "Reviews",
      iconsrc: Icons.home_outlined,
      color: colorCard4,
      count: 3412),
  OverviewTiles(
      title: "Tickets",
      iconsrc: Icons.home_outlined,
      color: colorCard5,
      count: 989),
];

 