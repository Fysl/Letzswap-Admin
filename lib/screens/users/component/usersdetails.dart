import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/models/usermodel/userVm.dart';

class ViewUserDetails extends StatefulWidget {
  final UserVM vModel;
  final String? token;
  const ViewUserDetails({ Key? key, required this.vModel, this.token }) : super(key: key);

  @override
  _ViewUserDetailsState createState() => _ViewUserDetailsState(vModel: vModel, token: token);
}

class _ViewUserDetailsState extends State<ViewUserDetails> {
   String? token;
  UserVM? vModel;
   _ViewUserDetailsState({required this.vModel, required this.token});
  @override
  Widget build(BuildContext context) {
        return SimpleDialog(
      backgroundColor: bgColor,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "User Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // passing true
              child: Icon(Icons.close),
            ),
          ],
        ),
      children:[ 
        Card(


      )
      ]);
  }
}