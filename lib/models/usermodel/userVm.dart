import 'dart:convert';

String UserVMToJson(UserVM data) => json.encode(data.toJson());

class UserVM {
   String email;
   String id;
   String userName;
   bool isactive;
     String mobileNumber;
     String image;
    String fullname;
    int? cityId;
    
     String profileGender;
   String dateofBirth;

  UserVM({
    required this.id,
    required this.email,
   required this.userName,
   required this.isactive,
      
   required this.mobileNumber,
   required this.image,
     required this.fullname,
   required this.profileGender,
   required this.dateofBirth,
   required this.cityId
 
   });

     Map<String, dynamic> toJson() => {
        "UserId": id,
        "Email": email,
        "UserName": userName,
        "Phone": mobileNumber,
        "UserFullName": fullname,
        "Gender": profileGender,
        "BirthDay": dateofBirth,
        
          
        // List<dynamic>.from(productAttachments.map((x) => x.toJson())),
   
        // List<dynamic>.from(productOpenTo.map((x) => x.toJson())),
    };
}