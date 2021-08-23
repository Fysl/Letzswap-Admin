
  class ProductOpenToVm {
    ProductOpenToVm({
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

    factory ProductOpenToVm.fromJson(Map<String, dynamic> json) => ProductOpenToVm(
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
  
