class ExchangeModel {
  Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;


  ExchangeModel({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory ExchangeModel.fromJson(Map<String, dynamic> json) => ExchangeModel(
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
        required this.exchangeid,
        required this.exchangetype,
        required this.exchangerId,
        required this.transactiondate,
        required this.status,
        required this.productowner,
        required this.isactive,
        required this.isdeleted
        
        // required this.createdby,
        // required this.updatedby,
        // required this.createdon,
        // required this.updatedon
    });

    int exchangeid;
    String exchangetype;
    String exchangerId;
    String transactiondate;
    String productowner;
    int status;
     bool isactive;
  bool isdeleted;
    // String createdby;
    // String updatedby;
    // DateTime createdon;
    // DateTime updatedon;
     
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        exchangeid: json["ExchangeID"],
        exchangetype: json["ExchangeType"],
        transactiondate: json["TransactionOn"],
        productowner:json["ProfileUserName"],
        exchangerId:json["TransactionBy"],
        status: json["Status"],
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