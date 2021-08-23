import 'dart:convert';

import 'package:http/http.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/overviewmodel/overviewmodel.dart';
import 'package:letzswap_dashboard/models/overviewmodel/userchartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OverViewController {
  Future<dynamic> getOverview(String? token) async {
    if (token == null) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString("token");
      print(token);
    }

    var newUrl = Uri.http(BASEURL.baseurl, "/api/overview/GetOverview");

    final response = await get(newUrl, headers: {
      'Authorization': 'Bearer ${token}',
      "Content-Type": "application/json; charset=UTF-8",
    });
 if (response.statusCode != 200) return null;
    if (response.statusCode == 200) {
      var res = json.decode(response.body)[1];
      var model = Overview.fromJson(res);

      print("Data loaded");
      return model.result;
    } else {
      print("Error in  Overview Loading");
      return json.decode(response.body);
    }
  }

   Future<UserChartModel> getUserChart(String? token) async {
//      if(token==null)
//      {
//  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     token= sharedPreferences.getString("token");
//     print(token);
//      }

 var newUrl=Uri.http(BASEURL.baseurl,"api/overview/GetUserChart");
 
    final response = await get(
        newUrl, headers: {
     
        'Authorization': 'Bearer ${token}',
        "Content-Type": "application/json; charset=UTF-8",

        

    });
    
    if (response.statusCode == 200) 
    
    {
     
     var res= json.decode(response.body);
  //  var model = UserChartModel.fromJson(res);  
   
      print("Data loaded");
      return res[1];

    } else {
         print("Error in  UserChart Loading");
      return json.decode(response.body);
    }
  }
}

