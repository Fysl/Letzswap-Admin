import 'package:letzswap_dashboard/models/file_Model.dart';
import 'package:letzswap_dashboard/models/productmodels/productopento.dart';

class ProductVm {
  int id;
  int categoryId;
  String productName;
  int productWorth;
  String productdescription;
  String producttags;
  List<dynamic> productOpenTo;
  // List<dynamic>?deletedopento;
   List<dynamic>attachments;
  //  List<File_Data_Model>file;
  //  List<dynamic>?deletedattachments;

  ProductVm(
      {required this.id,
      required this.categoryId,
      required this.productName,
      required this.productdescription,
      required this.producttags,
      required this.productWorth,
      required this.productOpenTo,
      // required this.deletedopento,
       required this.attachments,
      //  required this.file
      // required this.deletedattachments
      });

  factory ProductVm.fromJson(Map<String, dynamic> json) => ProductVm(
        id: json["Id"],
        categoryId: json["CategoryId"],
        productName: json["ProductName"],
        productWorth: json["ProductWorth"],
        productdescription: json["Description"],
        producttags: json["Tags"],
        productOpenTo:json["ProductOpenTo"],
        // deletedopento:json["DeletedProductOpenTo"],
        attachments:json["Attachments"],
        // file: json["ProductImages"]
        // deletedattachments:json["DeletedAttachments"]
      
      );
}

// class ProductOpenTo {
//   ProductOpenTo({
//     required this.id,
//     required this.categoryId,
//     required this.categoryName,
//     required this.categoryDescription,
//     required this.categoryType,
//     required this.createdOn,
//     required this.createdBy,
//     this.updatedOn,
//     this.updatedBy,
//     required this.isActive,
//     required this.isDeleted,
//   });

//   int id;
//   int categoryId;
//   String categoryName;
//   String categoryDescription;
//   int categoryType;
//   DateTime createdOn;
//   String createdBy;
//   dynamic updatedOn;
//   dynamic updatedBy;
//   bool isActive;
//   bool isDeleted;

//   factory ProductOpenTo.fromJson(Map<String, dynamic> json) => ProductOpenTo(
//         id: json["Id"],
//         categoryId: json["CategoryId"],
//         categoryName: json["CategoryName"],
//         categoryDescription: json["CategoryDescription"],
//         categoryType: json["CategoryType"],
//         createdOn: DateTime.parse(json["CreatedOn"]),
//         createdBy: json["CreatedBy"],
//         updatedOn: json["UpdatedOn"],
//         updatedBy: json["UpdatedBy"],
//         isActive: json["IsActive"],
//         isDeleted: json["IsDeleted"],
//       );

//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "CategoryId": categoryId,
//         "CategoryName": categoryName,
//         "CategoryDescription": categoryDescription,
//         "CategoryType": categoryType,
//         "CreatedOn": createdOn.toIso8601String(),
//         "CreatedBy": createdBy,
//         "UpdatedOn": updatedOn,
//         "UpdatedBy": updatedBy,
//         "IsActive": isActive,
//         "IsDeleted": isDeleted,
//       };
// }
