import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/models/overviewtiles.dart';

import '../../../constants.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
  }) : super(key: key);

  final OverviewTiles info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: info.color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.50),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: info.color!,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(info.iconsrc!, color: Colors.white),
              ),
              // Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          Text(
            "${info.count}",
            style: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),

          Text(
            info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: secondaryColor, fontSize: 10),
          ),
          // ProgressLine(
          //   color: info.color,
          //   percentage: info.percentage,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "${info.numOfFiles} Files",
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white70),
          //     ),
          //     Text(
          //       info.totalStorage!,
          //       style: Theme.of(context)
          //           .textTheme
          //           .caption!
          //           .copyWith(color: Colors.white),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({
//     Key? key,
//     this.color = primaryColor,
//     required this.percentage,
//   }) : super(key: key);

//   final Color? color;
//   final int? percentage;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 5,
//           decoration: BoxDecoration(
//             color: color!.withOpacity(0.1),
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//         LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth * (percentage! / 100),
//             height: 5,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
