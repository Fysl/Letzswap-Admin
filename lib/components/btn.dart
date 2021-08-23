import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, this.text, this.press}) : super(key: key);
  final String? text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: defaultPadding,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: colormain,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: press,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: defaultPadding,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
