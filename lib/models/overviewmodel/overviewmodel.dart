class Overview{

   Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;

     Overview({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
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
        required this.totalusers,
        required this.totalproducts,
        required this.totalswaps,
        required this.totalreviews,
      
        
       
    });

    int totalusers;
    int totalproducts;
    int totalswaps;
    int totalreviews;
    
    
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        totalusers: json["TotalUsers"],
        totalproducts: json["TotalProducts"],
        totalswaps: json["TotalSwaps"],
        totalreviews: json["TotalReviews"],
      
        
        
        // isdeleted: List<ProductAttachment>.from(json["ProductAttachments"].map((x) => ProductAttachment.fromJson(x))),
        // createdby: List<ProductOpenTo>.from(json["ProductOpenTo"].map((x) => ProductOpenTo.fromJson(x))),
    );
}