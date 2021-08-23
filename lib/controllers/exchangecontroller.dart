// import 'package:flutter/material.dart';

// class ExchangeController {

//    Future<dynamic> exchangeget(
//     BuildContext context,
//     String categoryname,
//     String categorydescription,
//     int categoryType,
//     String token,   
//   ) async {
//     var url = Uri.http(BASEURL.baseurl, "/api/ProductCategory/CreateCategory");
//     // SharedPreferences sp = await SharedPreferences.getInstance();
//     // token= await gettoken();
//     final response = await post(url,
//         headers: {
         
//        HttpHeaders.contentTypeHeader: 'application/json',
//         'Access-Control-Allow-Origin': '*',
//           'Authorization': 'Bearer ${token}',
//           "Content-Type": "application/json; charset=UTF-8",
//         },
         

//         body: jsonEncode({
//           "CategoryName": categoryname,
          
//           "CategoryDescription": categorydescription,
//             "CategoryType": categoryType
          
        
//         }));
        
 
//     if (response.statusCode == 200) {
// print("Success Category Added!!");

//    Fluttertoast.showToast(msg:"Success",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

       
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => CategoriesScreen()),
//       );
       
//       print("success");
//       print(response.body);
//     }
//       else{
//          print("error in category Add!");
         

//        Fluttertoast.showToast(msg: "Enter Valid Details Error Occured",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  
//       print(response.body);

//       }
//   }


// }