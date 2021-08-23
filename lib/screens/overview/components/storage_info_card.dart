import 'package:flutter/material.dart';

import '../../../constants.dart';

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard(
      {Key? key,
      required this.title,
      required this.svgSrc,
      required this.amountOfFiles
      // required this.numOfFiles,
      })
      : super(key: key);

  final String title, svgSrc, amountOfFiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(svgSrc),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: secondaryColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Text(
                  //   "$numOfFiles Files",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .caption!
                  //       .copyWith(color: Colors.white70),
                  // ),
                ],
              ),
            ),
          ),
          // Text(amountOfFiles)
        ],
      ),
    );
  }
}
