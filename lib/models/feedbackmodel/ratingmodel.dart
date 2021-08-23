 
class RatingModel {
  Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;


  RatingModel({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        response: Response.fromJson(json["Response"]),
        result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
        totalResults: json["TotalResults"],
        pageSize: json["PageSize"],
        pageNo: json["PageNo"],
    );

  
}
class Response {
    int responseId;
    String responseDesc;


    Response({
        required this.responseId,
        required this.responseDesc,
    });

  

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
        required this.id,
        required this.userid,
        required this.username,
        required this.rating,
        required this.type,
        required this.commentid,
        required this.isactive,
        required this.isdeleted
        
        // required this.createdby,
        // required this.updatedby,
        // required this.createdon,
        // required this.updatedon
    });

    int id;
    String userid;
    String username;
    double rating;
    String type;
    int commentid;
     bool isactive;
  bool isdeleted;
    // String createdby;
    // String updatedby;
    // DateTime createdon;
    // DateTime updatedon;
     
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        userid: json["UserId"],
        username: json["UserName"],
        rating:json["Rating"],
        type:json["Type"],
        commentid: json["CommentId"],
        isactive:json["IsActive"],
         isdeleted:json["IsDeleted"]
       
        // isdeleted: List<ProductAttachment>.from(json["ProductAttachments"].map((x) => ProductAttachment.fromJson(x))),
        // createdby: List<ProductOpenTo>.from(json["ProductOpenTo"].map((x) => ProductOpenTo.fromJson(x))),
    );
     

    // Map<String, dynamic> toJson() => {
    //     "Id": id,
    //     "ProductName": productName,
    //     "CategoryId": categoryId,
    //     "Description": description,
    //     "Tags": tags,
    //     "ProductVisits": productVisits,
    //     "ProductAttachments": List<dynamic>.from(productAttachments.map((x) => x.toJson())),
    //     "ProductOpenTo": List<dynamic>.from(productOpenTo.map((x) => x.toJson())),
    // };
}