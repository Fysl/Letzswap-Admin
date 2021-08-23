
import 'dart:convert';

AllProducts getUserProductsFromJson(String str) => AllProducts.fromJson(json.decode(str));

String getUserProductsToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
    AllProducts({
        required this.response,
        required this.result,
        required this.totalResults,
        required this.pageSize,
        required this.pageNo,
    });

    Response response;
    List<Result> result;
    int totalResults;
    int pageSize;
    int pageNo;

    factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        response: Response.fromJson(json["Response"]),
        result: List<Result>.from(json["Result"].map((x) => Result.fromJson(x))),
        totalResults: json["TotalResults"],
        pageSize: json["PageSize"],
        pageNo: json["PageNo"],
    );

    Map<String, dynamic> toJson() => {
        "Response": response.toJson(),
        "Result": List<dynamic>.from(result.map((x) => x.toJson())),
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
        required this.id,
        required this.productName,
        required this.categoryId,
        required this.description,
        required this.tags,
        required this.productVisits,
        required this.productworth,
        required this.productAttachments,
        required this.productOpenTo,
    });

    int id;
    String productName;
    int categoryId;
    String description;
    String tags;
    int productVisits;
      int productworth;
    List<ProductAttachment> productAttachments;
     List<ProductOpenTo> productOpenTo;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["Id"],
        productName: json["ProductName"],
        categoryId: json["CategoryId"],
        description: json["Description"],
        tags: json["Tags"],
        productVisits: json["ProductVisits"],
        productworth: json["ProductWorth"],
        productAttachments: List<ProductAttachment>.from(json["ProductAttachments"].map((x) => ProductAttachment.fromJson(x))),
        productOpenTo: List<ProductOpenTo>.from(json["ProductOpenTo"].map((x) => ProductOpenTo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "ProductName": productName,
        "CategoryId": categoryId,
        "Description": description,
        "Tags": tags,
        "ProductVisits": productVisits,
        "ProductWorth":productworth,
        "ProductAttachments": List<dynamic>.from(productAttachments.map((x) => x.toJson())),
        "ProductOpenTo": List<dynamic>.from(productOpenTo.map((x) => x.toJson())),
    };
}

class ProductAttachment {
    ProductAttachment({
        required this.attachId,
        required this.attachUrl,
       // required this.attachFileType,
        required this.attachStatus,
        required this.attachCreatedOn,
        required this.attachCreatedBy,
        this.attachUpdatedOn,
        this.attachUpdatedBy,
        required this.attachParentId,
        required this.attachTypeId,
       // required this.attachType,
       // required this.attachTitle,
    });

    int attachId;
    String attachUrl;
    //AttachFileType attachFileType;
    bool attachStatus;
    DateTime attachCreatedOn;
    String attachCreatedBy;
    dynamic attachUpdatedOn;
    dynamic attachUpdatedBy;
    int attachParentId;
    int attachTypeId;
   // AttachType attachType;
    //AttachTitle attachTitle;

    factory ProductAttachment.fromJson(Map<String, dynamic> json) => ProductAttachment(
        attachId: json["Attach_ID"],
        attachUrl: json["Attach_Url"],
        //attachFileType: attachFileTypeValues.map[json["Attach_FileType"]],
        attachStatus: json["Attach_Status"],
        attachCreatedOn: DateTime.parse(json["Attach_CreatedOn"]),
        attachCreatedBy: json["Attach_CreatedBy"],
        attachUpdatedOn: json["Attach_UpdatedOn"],
        attachUpdatedBy: json["Attach_UpdatedBy"],
        attachParentId: json["Attach_ParentId"],
        attachTypeId: json["Attach_TypeID"],
      //  attachType: attachTypeValues.map[json["Attach_Type"]],
       // attachTitle: attachTitleValues.map[json["Attach_Title"]]
    );

    Map<String, dynamic> toJson() => {
        "Attach_ID": attachId,
        "Attach_Url": attachUrl,
       // "Attach_FileType": attachFileTypeValues.reverse[attachFileType],
        "Attach_Status": attachStatus,
        "Attach_CreatedOn": attachCreatedOn.toIso8601String(),
        "Attach_CreatedBy": attachCreatedBy,
        "Attach_UpdatedOn": attachUpdatedOn,
        "Attach_UpdatedBy": attachUpdatedBy,
        "Attach_ParentId": attachParentId,
        "Attach_TypeID": attachTypeId,
       // "Attach_Type": attachTypeValues.reverse[attachType],
       // "Attach_Title": attachTitleValues.reverse[attachTitle],
    };
}

// enum AttachFileType { IMAGE }

// final attachFileTypeValues = EnumValues({
//     "IMAGE": AttachFileType.IMAGE
// });

// enum AttachTitle { PRODUCT_IMAGE }

// final attachTitleValues = EnumValues({
//     "Product_image": AttachTitle.PRODUCT_IMAGE
// });

// enum AttachType { PRODUCT }

// final attachTypeValues = EnumValues({
//     "PRODUCT": AttachType.PRODUCT
// });

class ProductOpenTo {
    ProductOpenTo({
        required this.id,
        required this.categoryId,
        required this.categoryName,
        required this.categoryDescription,
        required this.categoryType,
        required this.createdOn,
        required this.createdBy,
        this.updatedOn,
        this.updatedBy,
        required this.isActive,
        required this.isDeleted,
    });

    int id;
    int categoryId;
    String categoryName;
    String categoryDescription;
    int categoryType;
    DateTime createdOn;
    String createdBy;
    dynamic updatedOn;
    dynamic updatedBy;
    bool isActive;
    bool isDeleted;

    factory ProductOpenTo.fromJson(Map<String, dynamic> json) => ProductOpenTo(
        id: json["Id"],
        categoryId: json["CategoryId"],
        categoryName: json["CategoryName"],
        categoryDescription: json["CategoryDescription"],
        categoryType: json["CategoryType"],
        createdOn: DateTime.parse(json["CreatedOn"]),
        createdBy: json["CreatedBy"],
        updatedOn: json["UpdatedOn"],
        updatedBy: json["UpdatedBy"],
        isActive: json["IsActive"],
        isDeleted: json["IsDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "Id": id,
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "CategoryDescription": categoryDescription,
        "CategoryType": categoryType,
        "CreatedOn": createdOn.toIso8601String(),
        "CreatedBy": createdBy,
        "UpdatedOn": updatedOn,
        "UpdatedBy": updatedBy,
        "IsActive": isActive,
        "IsDeleted": isDeleted,
    };
}

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         // ignore: unnecessary_null_comparison
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
