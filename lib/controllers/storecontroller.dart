// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:letzswap_dashboard/helpers/BaseUrl.dart';

// class StoreController{

//    Future<Store> getAllproducts(String? token) async {

 
// var newUrl=Uri.http(BASEURL.baseurl,"/api/product/ProductList");
 
//      final response = await get(
//         newUrl, headers: {
//       //  HttpHeaders.authorizationHeader: 'Bearer $token',
//         'Authorization': 'Bearer ${token!}',
       
//     });
 
//     if (response.statusCode == 200) {
//      var res= json.decode(response.body);
 
//    var model =Store.fromJson(res);    

    
//      return model;


//     } else {
//       return json.decode(response.body);
//     }
//   }
// }