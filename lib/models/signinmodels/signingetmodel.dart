import 'dart:convert';

SigninModel signinModelFromJson(String str) =>
    SigninModel.fromJsonModel(json.decode(str));

// ignore: non_constant_identifier_names
String SigninModelToJson(SigninModel data) => json.encode(data.toJson());

class SigninModel {
  SigninModel({
    required this.response,
    required this.result,
    required this.totalResults,
    required this.pageSize,
    required this.pageNo,
  });

  Response response;
  Result result;
  int totalResults;
  int pageSize;
  int pageNo;

  factory SigninModel.fromJsonModel(Map<String, dynamic> json) => SigninModel(
        response: Response.fromJson(json["Response"]),
        result: Result.fromJson(json["Result"]),
        totalResults: json["TotalResults"],
        pageSize: json["PageSize"],
        pageNo: json["PageNo"],
      );

  Map<String, dynamic> toJson() => {
        "Response": response.toJson(),
        "Result": result.toJson(),
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
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.issued,
    required this.expires,
  });

  String accessToken;
  String tokenType;
  int expiresIn;
  DateTime issued;
  DateTime expires;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        issued: DateTime.parse(json[".issued"]),
        expires: DateTime.parse(json[".expires"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        ".issued": issued.toIso8601String(),
        ".expires": expires.toIso8601String(),
      };
}
