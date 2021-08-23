import 'dart:convert';

BookmarkModel getBookmarkFromJson(String str) =>
    BookmarkModel.fromJson(json.decode(str));

String getBookmarkToJson(BookmarkModel data) => json.encode(data.toJson());

class BookmarkModel {
  BookmarkModel({
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

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
        response: Response.fromJson(json["Response"]),
        result:
            List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
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
    required this.bookid,
    required this.userid,
    required this.productid,
    required this.productName,
    required this.categoryName,
    required this.bookedby,
    required this.productuser,
  });
  int bookid;
  int productid;
  String userid;
  String productName;
  String categoryName;
  String bookedby;
  String productuser;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        bookid: json["BookId"],
        userid: json["UserId"],
        productid: json["ProductId"],
        productName: json["ProductName"],
        categoryName: json["CategoryName"],
        bookedby: json["BookedBy"],
        productuser: json["ProductUser"],
      );

  Map<String, dynamic> toJson() => {
        "BookId": bookid,
        "UserId": userid,
        "ProductId": productid,
        "CategoryName": productName,
        "BookedBy": categoryName,
        "ProductUser": productuser,
      };
}
