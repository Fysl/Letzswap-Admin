class UserChartModel{

   Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;

     UserChartModel({
    required this.response, 
  required this.result,
  required this.totalResults,
  required this.pageSize,
  required this.pageNo});

  factory UserChartModel.fromJson(Map<String, dynamic> json) => UserChartModel(
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
        required this.activeusers,
        required this.inactiveuser,
        required this.totalusers,
       
      
        
       
    });

    int activeusers;
    int inactiveuser;
    int totalusers;
 
    
    
   
   
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        activeusers: json["ActiveUsers"],
        inactiveuser: json["InActiveUsers"],
        totalusers: json["TotalUsers"]
     
  
         
    );
}

class UserChartVm {

   int activeusers;
    int inactiveuser;
    int totalusers;

     UserChartVm({
        required this.activeusers,
        required this.inactiveuser,
        required this.totalusers,
       
      
           
    });
  
}
