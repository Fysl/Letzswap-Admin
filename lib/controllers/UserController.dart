import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
 

import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/usermodel/cityCountryVm.dart';
import 'package:letzswap_dashboard/models/usermodel/userVm.dart';
import 'package:letzswap_dashboard/models/usermodel/usermodel.dart';
import 'package:letzswap_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:letzswap_dashboard/screens/users/usersscreen.dart';

class UserController {
  
   Future<UserModel?> postprofileupdate(
    BuildContext context,
     UserVM model,
    String token,   
   //     final queryParameters = {
//   'param1': 'one',
//   'param2': 'two',
// };
  ) async {
    var url = Uri.http(BASEURL.baseurl, "/api/profile/ProfileUpdate");
     
   var _body=model.toJson();
      // var ob= User.fromJson(model);
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // token= await gettoken();
    final response = await http.post(url,
        headers: {
          //  HttpHeaders.authorizationHeader: 'Token $token',
      // HttpHeaders.contentTypeHeader: 'application/json',
       // 'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
          //"Content-Type": "application/json; charset=UTF-8",
        },
      

        body: _body,
    );
       
      
    if (response.statusCode == 200) {
print("profile Updated");

   Fluttertoast.showToast(msg:"Success",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

       
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()
      ));
       
      print("success");
      print(response.body);
    }
      else{
         print("error");
         print("Error In profile Update");

       Fluttertoast.showToast(msg: "Enter Valid Details Error Occured",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  
      print(response.body);

      }
  }

   Future<dynamic> getCityById(String token,int Id) async {

 var newUrl=Uri.http(BASEURL.baseurl,"/api/ProductCategory/getCountryById");
 
    final response = await get(
        newUrl, headers: {
     
        'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json; charset=UTF-8",       
    },   
    );
 
    if (response.statusCode == 200) {
     
     var res= json.decode(response.body);
   var model = CityCountryVm.fromJson(res);  
   
      print("Subcat List Loaded");
      return model;

    } else {
         print("Error in Category List Loaded");
      return json.decode(response.body);
    }
  }
//    static Future<UserModel> getUserById(String Id,String token) async {
   
//     final queryParameters = {
//   'id': Id,
  
// };
// var newUrl=Uri.http(BASEURL.baseurl,"/api/profile/ProfileInfo",queryParameters);
//     final response = await http.get(
//         newUrl, headers: {
//        'Authorization': 'Bearer ${token}',
//       // HttpHeaders.contentTypeHeader: 'application/json',
//       // HttpHeaders.acceptHeader:'*/*',
//       // "Access-Control-Allow-Origin": "*",
//       //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
//             //  HttpHeaders.connectionHeader: 'keep-alive',
//       //  HttpHeaders.acceptEncodingHeader: 'gzip, deflate, br',
//     });

//     if (response.statusCode == 200) {
//    print(response.body);
//       // var jsonResponse = jsonDecode(response.body);
//       // print(jsonResponse);
//   //      var dataresult= jsonResponse['result'].map((model) => Data.fromJson(model)).toList();
//  var item=json.decode(response.body);
//   // Iterable list = item['Result'];
//   //   return  list.map((model) => User.fromJson(model))
//   //     .toList();
   
//     } else {
//       return json.decode(response.body);
//     }
//   }
   Future<dynamic> userrequestStatus(String id,bool flag,String token) async {
   
//     final queryParameters = {
//   'param1': 'one',
//   'param2': 'two',
// };
var newUrl=Uri.http(BASEURL.baseurl,"/api/profile/ProfileUpdate");
    final response = await http.post(
        newUrl, headers: {
               'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json; charset=UTF-8",
       //HttpHeaders.acceptHeader:'*/*',
      //  "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
            //  HttpHeaders.connectionHeader: 'keep-alive',
      //  HttpHeaders.acceptEncodingHeader: 'gzip, deflate, br',
    },
   body: jsonEncode({
          "UserId": id,
          // "userPhone": phoneno,
          "IsActive": flag,
          //  "grantType": "password"
        }));
    

    if (response.statusCode == 200) {
   
 var item=json.decode(response.body);
   
  // Iterable list = item['Result'];
  //   return  list.map((model) => User.fromJson(model))
  //     .toList();
        Fluttertoast.showToast(msg:"Block Successfully",textColor: Colors.white,backgroundColor: Colors.green,webPosition: "bottom");
        
   
    } else {
      Fluttertoast.showToast(msg: "Error In blocking User",textColor: Colors.white,backgroundColor: Colors.red,webPosition: "bottom");
      return json.decode(response.body);
    }
  }
}
