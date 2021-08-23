class CityModel {
  Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;


  CityModel({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
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
        required this.countryId,
        required this.type,
        required this.name,
        required this.isactive,
        required this.isdeleted,
        // required this.createdby,
        // required this.updatedby,
        // required this.createdon,
        // required this.updatedon
    });

    int id;
    int countryId;
    int type;
    String name;
    
    bool isactive;
    bool isdeleted;
    // String createdby;
    // String updatedby;
    // DateTime createdon;
    // DateTime updatedon;
     
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        countryId: json["CountryId"],
        type: json["Type"],
        name: json["Name"],
        isactive: json["IsActive"],
        isdeleted: json["IsDeleted"],
        // createdon: json["CreatedOn"], 
        // updatedon: json["UpdatedOn"],
        // createdby: json["CreatedBy"],
        // updatedby: json["UpdatedBy"],
        
        
        
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