
import 'dart:convert';

Bookmark getBookmarkFromJson(String str) => Bookmark.fromJson(json.decode(str));

String getBookmarkToJson(Bookmark data) => json.encode(data.toJson());

class Bookmark {
    Bookmark({
        required this.response,
        required this.result,
        required this.totalResults,
        required this.pageSize,
        required this.pageNo,
    });

    Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;

    factory Bookmark.fromJson(Map<String, dynamic> json) => Bookmark(
        response: Response.fromJson(json["Response"]),
        result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
        totalResults: json["TotalResults"],
        pageSize: json["PageSize"],
        pageNo: json["PageNo"],
    );

    Map<String, dynamic> toJson() => {
        "Response": response.toJson(),
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
        "TotalResults": totalResults,
        "PageSize": pageSize,
        "PageNo": pageNo,
    };
}

class Response {
    Response({
        required this.responseId,
        required this.responseDesc,
    });

    int responseId;
    String responseDesc;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        responseId: json["ResponseId"],
        responseDesc: json["ResponseDesc"],
    );

    Map<String, dynamic> toJson() => {
        "ResponseId": responseId,
        "ResponseDesc": responseDesc,
    };
}

class Result {
    Result({
        required this.bookmarkId,
            required this.product  
    });

    int bookmarkId;
  
     List<Product> product;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        bookmarkId: json["BookmarkId"], 
        product: List<Product>.from(json["Product"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "BookmarkId": bookmarkId,
        "Product": List<dynamic>.from(product.map((x) => x.toJson())),
    };
}

 
 
class Product {
    Product({
      required this.id,
required this.categoryId,
        required this.productName,
        required this.productdescription,
        required this.producttags,
         required this.productWorth
    });

     int id;
     int categoryId;
    String productName;
    int productWorth;
    String productdescription;
    String producttags;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
         id: json["Id"],
       categoryId: json["CategoryId"],
        productName: json["ProductName"],
        productWorth: json["ProductWorth"],
        productdescription: json["Description"],
        producttags: json["Tags"],
        
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "ProductName": productName,
        "ProductWorth": productWorth,
        "Description": productdescription,
        "Tags": producttags
    };
}

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         // ignore: unnecessary_null_comparison
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
