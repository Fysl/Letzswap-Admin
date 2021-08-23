import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/locationmodels/citymodel.dart';

class LocationController{

   Future<dynamic> getCities(String? token,int? countryId) async {

       final queryParameters = {
  'Id': countryId.toString()
   
};

 
var newUrl=Uri.http(BASEURL.baseurl,"/api/profile/CitiesList",queryParameters);
 
     final response = await get(
        newUrl, headers: {
      
        'Authorization': 'Bearer ${token!}',
       
    });
    var res= json.decode(response.body);
 
    if (response.statusCode == 200) 
    {
     
  
 
   var model =CityModel.fromJson(res);    
  Fluttertoast.showToast(msg:"Cities Listed!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

    
     return model;


    }
    
     else 
     {
       Fluttertoast.showToast(msg:"Error In CityList!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
      return res;
    }
  }

  

}