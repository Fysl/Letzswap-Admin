 

class DeliveryModel {
  Response response;
  List<Result> result;
  int totalResults;
  int pageSize;
  int pageNo;

  DeliveryModel(
      {required this.response,
      required this.result,
      required this.totalResults,
      required this.pageSize,
      required this.pageNo});

  factory DeliveryModel.fromJson(Map<String, dynamic> json) => DeliveryModel(
        response: Response.fromJson(json["Response"]),
        result:
            List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
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
  Result(
      {
      required this.id,
      required this.userid,
      required this.name,
      required this.typeid,
      required this.timeline,
      required this.username,
      required this.coordinateid,
      required this.description,
      required this.currencytype,
      required this.amount,
      required this.payment,
      required this.isactive,
      required this.createdon,
      required this.status,
      required this.createdby,
      required this.isdeleted

      // required this.createdby,
      // required this.updatedby,
      // required this.createdon,
      // required this.updatedon
      });

  int id;
  String userid;
  String name;
  int typeid;
  String username;
  String timeline;
  int coordinateid;
  String description;
  String currencytype;
  double amount;
  double payment;
  bool isactive;
  bool isdeleted;
  String createdon;
  String status;
  String createdby;
  // String createdby;
  // String updatedby;
  // DateTime createdon;
  // DateTime updatedon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      id: json["Id"],
      userid: json["UserId"],
      typeid: json["TypeId"],
      username: json["ProfileUserName"],
      name: json["Name"],
      timeline: json["Timeline"],
      coordinateid: json["CoordinateId"],
      description: json["Description"],
      currencytype: json["CurrencyType"],
      amount: json["Amount"],
      payment: json["Payment"],
      status: json["Status"],
      isactive: json["IsActive"],
      createdby: json["CreatedBy"],
      createdon: json["CreatedOn"],
      isdeleted: json["IsDeleted"]

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
