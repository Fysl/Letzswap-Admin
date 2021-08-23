class DeviceModel {
  Response response;
  List<Result> result;
  int totalResults;
  int pageSize;
  int pageNo;

  DeviceModel(
      {required this.response,
      required this.result,
      required this.totalResults,
      required this.pageSize,
      required this.pageNo});

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
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
      {required this.id,
      required this.userid,
      required this.transactiondate,
      required this.deviceinfo,
      required this.coordinates,
      required this.isactive,
      required this.CreatedOn

      // required this.createdby,
      // required this.updatedby,
      // required this.createdon,
      // required this.updatedon
      });

  int id;
  String userid;
  String transactiondate;
  String deviceinfo;

  String coordinates;
  bool isactive;
  String CreatedOn;
  // String createdby;
  // String updatedby;
  // DateTime createdon;
  // DateTime updatedon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      id: json["Id"],
      userid: json["UserId"],
      transactiondate: json["TransactionDate"],
      deviceinfo: json["DeviceInfo"],
      coordinates: json["Coordinates"],
      isactive: json["IsActive"],
      CreatedOn: json["CreatedOn"]

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
