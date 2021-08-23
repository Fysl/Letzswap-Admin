class UserModel {
  Response response;
  List<Result> result;
  int totalResults;
  int pageSize;
  int pageNo;

  UserModel(
      {required this.response,
      required this.result,
      required this.totalResults,
      required this.pageSize,
      required this.pageNo});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
      required this.email,
      required this.userName,
      required this.mobileNumber,
      required this.fullname,
      required this.profileGender,
      required this.dateofBirth,
      required this.image,
      required this.isactive,
      required this.isdeleted,
      required this.county,
      required this.city
      // required this.createdby,
      // required this.updatedby,
      // required this.createdon,
      // required this.updatedon
      });

  String email;
  String id;
  String userName;
  String mobileNumber;
  String fullname;

  String profileGender;
  String dateofBirth;
  bool isactive;
  bool isdeleted;
  String image;
  int? county;
  int? city;
  // String createdby;
  // String updatedby;
  // DateTime createdon;
  // DateTime updatedon;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      id: json['UserID'],
      email: json['Email_Address'] ?? 'Null',
      userName: json['UserName'] ?? 'Null',
      isactive: json['Profile_Active'],
      mobileNumber: json['Mobile_Number'] ?? null,
      fullname: json['Fullname'] ?? 'Null',
      profileGender: json['Profile_Gender'] ?? 'Null',
      dateofBirth: json['Profile_Date_of_Birth'].toString(),
      isdeleted: json['Profile_Deleted'],
      image: json['Image_Location'] ?? 'Null',
      city: json['Profile_City'] ?? null,
      county: json['Profile_Country'] ?? null
      // createdon: json["CreatedOn"],
      // updatedon: json["UpdatedOn"],
      // createdby: json["CreatedBy"],
      // updatedby: json["UpdatedBy"],

      // isdeleted: List<ProductAttachment>.from(json["ProductAttachments"].map((x) => ProductAttachment.fromJson(x))),
      // createdby: List<ProductOpenTo>.from(json["ProductOpenTo"].map((x) => ProductOpenTo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserID": id,
        "Email_Address": email,
        "UserName": userName,
        "Mobile_Number": mobileNumber,
        "Fullname": fullname,
        "Profile_Gender": profileGender,
        "Profile_Active": isactive

        // List<dynamic>.from(productAttachments.map((x) => x.toJson())),

        // List<dynamic>.from(productOpenTo.map((x) => x.toJson())),
      };
}
