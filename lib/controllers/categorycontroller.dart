import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/controllers/categorycontroller.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/screens/categories/categoriesscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController{

  Future<CategoryVm?> updatecategory(
    BuildContext context,
    CategoryVm model,
    String token,   
  ) async {
    var url = Uri.http(BASEURL.baseurl, "/api/ProductCategory/UpdateCategory");
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // token= await gettoken();
    final response = await post(url,
        headers: {
          //  HttpHeaders.authorizationHeader: 'Token $token',
       HttpHeaders.contentTypeHeader: 'application/json',
        'Access-Control-Allow-Origin': '*',
//         'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
//  'Access-Control-Allow-Headers': 'Origin, Content-Type, X-Auth-Token'
          // "Access-Control-Allow-Origin": "*", // Required for CORS support to work
          // "Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
          //  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
          //  "Access-Control-Allow-Methods": "POST, OPTIONS",
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json; charset=UTF-8",
        },
         

        body: jsonEncode({
           "CategoryId":model.categoryid,
          "CategoryName": model.categoryname,
          "CategoryType":0,
          // "ImageBase":"\Content\ServerContent\ProductCategoryImages\Home\637611978107480585.png",
          "CategoryDescription": model.categorydescription,                 
        }));
        // print("Category Added!");

 
    if (response.statusCode == 200) {
print("Category Updated!!");

   Fluttertoast.showToast(msg:"Category Updated",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

       
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardScreen()),
      // );
       
      // print("success");
      print(response.body);
    }
      else{
        //  print("error");
         print("Error in Category Update");

       Fluttertoast.showToast(msg: "Enter Valid Details Error Occured",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  
      print(response.body);

      }
    


  }


 Future<CategoryModel?> postmaincategory(
    BuildContext context,
    String categoryname,
    String categorydescription,
    int categoryType,
    String token,   
  ) async {
    var url = Uri.http(BASEURL.baseurl, "/api/ProductCategory/CreateCategory");
    // SharedPreferences sp = await SharedPreferences.getInstance();
    // token= await gettoken();
    final response = await post(url,
        headers: {
         
       HttpHeaders.contentTypeHeader: 'application/json',
        'Access-Control-Allow-Origin': '*',
          'Authorization': 'Bearer ${token}',
          "Content-Type": "application/json; charset=UTF-8",
        },
         

        body: jsonEncode({
          "CategoryName": categoryname,
          
          "CategoryDescription": categorydescription,
            "CategoryType": categoryType
          
        
        }));
        
 
    if (response.statusCode == 200) {
print("Success Category Added!!");

   Fluttertoast.showToast(msg:"Success",textColor: Colors.white,backgroundColor: Colors.green,webPosition: "bottom");

       
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => CategoriesScreen()),
      // );
       
      print("success");
      print(response.body);
    }
      else{
         print("error in category Add!");
         

       Fluttertoast.showToast(msg: "Enter Valid Details Error Occured",textColor: Colors.white,backgroundColor: Colors.red,webPosition: "bottom");
  
      print(response.body);

      }
  }

  Future<CategoryModel> getcatById(String token) async {

var newUrl=Uri.http(BASEURL.baseurl,"/api/ProductCategory/MainCategories");
 
    final response = await get(
        newUrl, headers: {
     
        'Authorization': 'Bearer ${token}',

    });

    if (response.statusCode == 200) {
     var res= json.decode(response.body);
   var model =CategoryModel.fromJson(res);  
      print("Main List Loaded");
     return model;


    } else {
         print("Error in Category List Loaded");
      return json.decode(response.body);
    }
  }

  Future<dynamic> getcatname(String token,int catId) async {

 var newUrl=Uri.http(BASEURL.baseurl,"/api/ProductCategory/SearchCategory");
 
    final response = await post(
        newUrl, headers: {
     
        'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json; charset=UTF-8",    
    },
     body: jsonEncode({
             
            "CategoryId": catId  
        })
    
    );
 
    if (response.statusCode == 200) {
     
     var res= json.decode(response.body);
   var model = CategoryModel.fromJson(res);  
   
      print("Search Category List Loaded");
      return model.result[0].categoryname;

    } else {
         print("Error in Category List Loaded");
      return json.decode(response.body);
    }
  }

  Future<CategoryModel> getsubcatlist(String token,int catId) async {
    final queryParameters = {
  'categoryId': catId.toString(),
  
};
var newUrl=Uri.http(BASEURL.baseurl,"/api/ProductCategory/SubCategories",queryParameters);
 
    final response = await get(
        newUrl, headers: {
     
        'Authorization': 'Bearer ${token}',

    });

    if (response.statusCode == 200) {
     var res= json.decode(response.body);
    var model =CategoryModel.fromJson(res); 
    // var dataresult= res['result'].map((model) => CategoryVm.fromJson(model)).toList(); 
    
      print("Subcat List Loaded");
       
     return model;


    } else {
         print("Error in Category List Loaded");
      return json.decode(response.body);
    }
  }

  


}