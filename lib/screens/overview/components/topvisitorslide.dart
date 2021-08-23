import 'package:flutter/material.dart';

class TopvisitorSilder extends StatelessWidget {
  const TopvisitorSilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 80,
        height: 40,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  child: Image.asset(
                      'assets/images/profile1.png'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  child: Image.asset(
                      'assets/images/profile1.png'), // Provide your custom image
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.red,
                  child: Image.asset(
                      'assets/images/profile1.png'), // Provide your custom image
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
