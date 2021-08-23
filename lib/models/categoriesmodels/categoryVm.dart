class CategoryVm {
     int categoryid;
    String categoryname;
    String categorydescription;
    String imagepath;
   


  CategoryVm({
required this.categoryid,
        required this.categoryname,
        required this.categorydescription,
        required this.imagepath,
  });

      factory CategoryVm.fromJson(Map<String, dynamic> json) => CategoryVm(
        categoryid: json["CategoryId"],
        categoryname: json["CategoryName"],
        categorydescription: json["CategoryDescription"],
        imagepath: json["ImagePath"],
       // categorytype: json["CategoryType"],
        
        // createdon: json["CreatedOn"], 
        // updatedon: json["UpdatedOn"],
        // createdby: json["CreatedBy"],
        // updatedby: json["UpdatedBy"],
        
        
        // isdeleted: List<ProductAttachment>.from(json["ProductAttachments"].map((x) => ProductAttachment.fromJson(x))),
        // createdby: List<ProductOpenTo>.from(json["ProductOpenTo"].map((x) => ProductOpenTo.fromJson(x))),
    );
}