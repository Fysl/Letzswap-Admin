import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'userchart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Storage Details",
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          SizedBox(height: defaultPadding),
           UserChart(),
          SizedBox(height: defaultPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Users',
                style: TextStyle(color: secondaryColor),
              ),
              Text(
                '2k+ Today',
                style: TextStyle(color: colormain),
              )
            ],
          ),
          StorageInfoCard(
            svgSrc: "assets/images/profile1.png",
            title: "User 1",
            amountOfFiles: "1.3GB",
            // numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/profile1.png",
            title: "User 2",
            amountOfFiles: "15.3GB",
            // numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/profile1.png",
            title: "User 3",
            amountOfFiles: "1.3GB",
            // numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: "assets/images/profile1.png",
            title: "User 4",
            amountOfFiles: "1.3GB",
            // numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
