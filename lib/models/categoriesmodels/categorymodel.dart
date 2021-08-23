class CategoryModel {
  Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;


  CategoryModel({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
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
        required this.categoryid,
        required this.categoryname,
        required this.categorydescription,
        required this.imagepath,
        required this.categorytype,
        required this.isactive,
        required this.isdeleted,
        // required this.createdby,
        // required this.updatedby,
        // required this.createdon,
        // required this.updatedon
    });

    int categoryid;
    String categoryname;
    String categorydescription;
    String imagepath;
    int categorytype;
    bool isactive;
    bool isdeleted;
    // String createdby;
    // String updatedby;
    // DateTime createdon;
    // DateTime updatedon;
     
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        categoryid: json["CategoryId"],
        categoryname: json["CategoryName"],
        categorydescription: json["CategoryDescription"],
        imagepath: json["ImagePath"],
        categorytype: json["CategoryType"],
        isactive: json["IsActive"],
        isdeleted: json["IsDeleted"],
        // createdon: json["CreatedOn"], 
        // updatedon: json["UpdatedOn"],
        // createdby: json["CreatedBy"],
        // updatedby: json["UpdatedBy"],
        
        
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