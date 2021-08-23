import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signinmodel.dart';
import 'package:letzswap_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class SigninAuthenticate {
  Future<SigninModel?> signIp(
    BuildContext context,
    String email,
    String password,
    // SigninModel modeltoken,
  ) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.http(BASEURL.baseurl, "/api/account/SigninAuthentication");
    // SharedPreferences sp = await SharedPreferences.getInstance();
    final response = await post(url,
        headers: {
        'Access-Control-Allow-Origin': '*',
//         'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
//  'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
          // "Access-Control-Allow-Origin": "*", // Required for CORS support to work
          // "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
          //  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          //  "Access-Control-Allow-Methods": "POST, OPTIONS",
          "Content-Type": "application/json; charset=UTF-8",
        },
        // encoding: Encoding.getByName("utf-8"),

        body: jsonEncode({
          "UserData": email,
          // "userPhone": phoneno,
          "userPassword": password,
          //  "grantType": "password"
        }));
print(response.body);
    if (response.statusCode == 200) {
        SigninModel token = SigninModel.fromJsonModel(jsonDecode(response.body));
 String savetoken = jsonEncode(token);
      sharedPreferences.setString('token', savetoken);

      // print("Token:");
      // print(token.result.accessToken);

    Fluttertoast.showToast(msg:"Success",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
      
      print("success");
      // print(response.body);
    } else {
      

      print("error");
       Fluttertoast.showToast(msg: "Enter Valid Details Error Occured",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  
      print(response.body);

    }
  }
}
