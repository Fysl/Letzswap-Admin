import 'dart:convert';
import 'dart:io';
 

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/productmodels/productbookmarkmodel.dart';
import 'package:letzswap_dashboard/models/productmodels/productVm.dart';
import 'package:letzswap_dashboard/models/productmodels/productmodel.dart';
// import 'package:letzswap_dashboard/models/productmodels/productopento.dart';
 
 

class ProductController {

 Future<ProductVm?> updateProduct(
    BuildContext context,
    
    ProductVm model,
    String token,   
  ) async {
    var url = Uri.http(BASEURL.baseurl, "api/product/UpdateProduct");  
 var request = http.MultipartRequest(
              "POST",
               url,
               );
            
               request.headers.addAll({'Authorization': 'Bearer $token'});
               request.fields['ProductID'] = model.id.toString();
               request.fields['ProductName'] = model.productName.toString();
               request.fields['ProductCategory'] = model.categoryId.toString();
               request.fields['ProductWorth'] = model.productWorth.toString();
               request.fields['ProductDescription'] = model.productdescription.toString();
                request.fields['Tags'] = model.producttags.toString();
               request.fields['ProductOpenTo'] = json.encode(model.productOpenTo);
                //  request.fields['ProductOpenToDeleted'] = "1,2,3";
                  request.fields['Attachments'] =json.encode(model.attachments);
                  
                  //  request.fields['ProductAttachmentDeleted'] = "22,23";
                   //for path
                  //  request.files.add(http.MultipartFile.fromPath('ProductImages','build/package.tar.gz',
                  // contentType: new MediaType('application', 'x-tar'),));
                  //for bytes
                  //  request.files.add(new http.MultipartFile.fromBytes('ProductImages', await File.fromUri("<path/to/file>").readAsBytes(), contentType: new MediaType('image', 'jpeg')));
                 request.send().then((result) async {

  http.Response.fromStream(result)
      .then((response) {

    if (response.statusCode == 200)
    {
      print("Uploaded! ");
      print('response.body '+response.body);
    }

    return response.body;

  });
// ignore: invalid_return_type_for_catch_error
}).catchError((err) => print('error : '+err.toString()))
    .whenComplete(()
{
  
});
                 
          // request.files.add(await http.MultipartFile.fromPath(
          //   'image',
          //   path,
//  )
// request.send().then((response) {
//   if (response.statusCode == 200)
//   {
//     print(response.stream.bytesToString());
// print("Uploaded!");
//   } 
//     else{
// Fluttertoast.showToast(msg: "Error in product Update",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
//   }
// });
  // var streamedResponse = await request.send();
  // if (streamedResponse.statusCode == 200) {
  //     var response = http.Response.fromStream(streamedResponse);
  //    Fluttertoast.showToast(msg:"Product Updated!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "botltom");
  //    List<dynamic>? responselist;
  //    response.then((value) => 
  //    responselist!.add(value)
  //    );
       
  //     print("updated product");
  // }

  
    
    }  

        // body: jsonEncode({
        //   "Id": model.id,     
        //   "ProductName": model.productName,  
        //   "CategoryId":model.categoryId,
        //   "ProductWorth":model.productWorth,
        //   "Description":model.productdescription,
        //   "Tags":model.producttags,
        //   "ProductOpenTo":model.productOpenTo
        // }));
        // print("Category Added!");

 
  //   if (request.statusCode == 200) {


  //  Fluttertoast.showToast(msg:"Product Updated!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  //     print(request.body);
      
  //   }
  //     else{
  //      Fluttertoast.showToast(msg: "Error in product Update",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
  
  //     print(request.body);

  //     }
    


 

//   Future<AllProducts> getAllproducts(String? token) async {

 
// var newUrl=Uri.http(BASEURL.baseurl,"/api/product/ProductList");
 
//      final response = await get(
//         newUrl, headers: {
//       //  HttpHeaders.authorizationHeader: 'Bearer $token',
//         'Authorization': 'Bearer ${token!}',
       
//     });
 
//     if (response.statusCode == 200) {
//      var res= json.decode(response.body);
 
//    var model =AllProducts.fromJson(res);    

    
//      return model;


//     } else {
//       return json.decode(response.body);
//     }
//   }

 Future<dynamic> deleteProduct(String? token,int? productId) async {

       final queryParameters = {
  'id': productId
   
};

 
var newUrl=Uri.http(BASEURL.baseurl,"/api/product/ProductDelete",queryParameters);
 
     final response = await put(
        newUrl, headers: {
      
        'Authorization': 'Bearer ${token!}',
       
    });
    var res= json.decode(response.body);
 
    if (response.statusCode == 200) 
    {
     
 
  Fluttertoast.showToast(msg:"Product Deleted!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");

    
     return res;


    }
    
     else 
     {
       Fluttertoast.showToast(msg:"Error In product Delete!!",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
      return res;
    }
  }

  

Future<Bookmark> getproductbookmarks(String? token) async {

//   final queryParameters = {
//   'pageNo': "1"
   
// };
var newUrl=Uri.http(BASEURL.baseurl,"/api/product/UserGetBookmark");
 
     final response = await get(
        newUrl, headers: {
      //  HttpHeaders.authorizationHeader: 'Bearer $token',
        'Authorization': 'Bearer ${token!}',
       
    });
 
    if (response.statusCode == 200) {
     var res= json.decode(response.body);
 
   var model =Bookmark.fromJson(res);    

    
     return model;


    } else {
      return json.decode(response.body);
    }
  }

 

   

//   static Future<List<AllProducts>> getProductList() async {
   
//     final queryParameters = {
//   'key': 'user'
   
// };
// var newUrl=Uri.http(BASEURL.baseurl, "/api/product/ProductList", queryParameters);
//     final response = await http.get(
//         newUrl, headers: {
//           //  HttpHeaders.authorizationHeader: 'Bearer $token',
//         HttpHeaders.contentTypeHeader: 'application/json',
//         // "Authorization":
//       // HttpHeaders.authorizationHeader: 'Token $token',
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
//   Iterable list = item;
//     return  list.map((model) => AllProducts.fromJson(model))
//       .toList();
   
//     } else {
//       return json.decode(response.body);
//     }
//   }
}