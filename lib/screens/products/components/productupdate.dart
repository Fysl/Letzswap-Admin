import 'dart:convert';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;
import 'dart:math';

import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:letzswap_dashboard/controllers/ProductController.dart';
import 'package:letzswap_dashboard/controllers/categorycontroller.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/helpers/dropzonewidgets/DropZoneWidget.dart';
import 'package:letzswap_dashboard/helpers/dropzonewidgets/DroppedFileWidget.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/file_Model.dart';
import 'package:letzswap_dashboard/models/productmodels/checkmodel.dart';
import 'package:letzswap_dashboard/models/productmodels/productVm.dart';
import 'package:letzswap_dashboard/models/productmodels/subcategorycheck.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class ProductUpdate extends StatefulWidget {
  final ProductVm model;
  final String? newtoken;

  const ProductUpdate({
    Key? key,
    required this.model,
    required this.newtoken,
  }) : super(key: key);
  @override
  _ProductUpdateState createState() =>
      _ProductUpdateState(model: model, newtoken: newtoken);
}

class _ProductUpdateState extends State<ProductUpdate> {
  ProductVm model;
  String? newtoken;
  dynamic flag;
  final _formKey = GlobalKey<FormState>();
  List<SubCategoryCheckedModel>? _opentoChecked;
  List<CheckModel>? _attachmentchecked;
  final _pickedImages = <dynamic>[];
 

  String _imageInfo = '';

  _ProductUpdateState({required this.model, required this.newtoken});

  TextEditingController tproductname = new TextEditingController();
  TextEditingController tcategory = new TextEditingController();
  TextEditingController tproductworth = new TextEditingController();
  TextEditingController tproductdescription = new TextEditingController();
  TextEditingController tproducttags = new TextEditingController();
  String? selectedvalue;
  String? selectedText;
  late Future _future;
  late Future<dynamic> _futurecatbyId;
  List<File_Data_Model>? file;
  List<dynamic>? subcatlist;
  List<dynamic>? newopenTo = [];

  @override
  void initState() {
    _future = CategoryController().getcatById(newtoken!);
    _futurecatbyId = CategoryController()
        .getcatname(newtoken!, model.categoryId)
        .then((value) => selectedText = value);

    _opentoChecked = model.productOpenTo
        .map((el) => SubCategoryCheckedModel(
            opentoId: el.id,
            categoryid: el.categoryId,
            categoryname: el.categoryName,
            // categorydescription: e.categoryDescription,
            // imagepath: e.imagepath,
            value: true))
        .toList();
    _attachmentchecked = model.attachments
        .map((e) => CheckModel(id: e.attachId, name: e.attachUrl, value: true))
        .toList();

    getsub(model.categoryId);
    // .then((value) => value.result.map((e) => SubCategoryCheckedModel(
    //     categoryid: e.categoryid,
    //     categoryname: e.categoryname,
    //     categorydescription: e.categorydescription,
    //     imagepath: e.imagepath,
    //     value: true)));

    setState(() {
      tproductname.text = model.productName;
      tproductworth.text = model.productWorth.toString();
      tproducttags.text = model.producttags;
      tproductdescription.text = model.productdescription;
      selectedvalue = model.categoryId.toString();

      for (var item in model.productOpenTo) {
        newopenTo!.add({"categoryid": item.categoryId, "OpenTo": item.id});
      }
      // selectedText=_futurecatbyId.toString();
    });
    print("initial state");
    print(newopenTo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Update Product",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // passing true
              child: Icon(Icons.close),
            ),
          ],
        ),
        children: [
          Card(
            // drawer: SideMenu(),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (Responsive.isDesktop(context))
                // Expanded(
                //   child: SideMenu(),
                // ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                    ),
                    height: 800,
                    width: 500,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Wrap(
                // spacing: 15.0,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    child: SizedBox(
                      width: 500,
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              // ignore: unnecessary_null_comparison
                              _pickedImages == null ? 0 : _pickedImages.length,
                          itemBuilder: (context, index) =>
                              _pickedImages[index]),
                    ),
                  ),                  
                ],
              ),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),
                // ElevatedButton(
                //   onPressed: _pickVideo,
                //   child: const Text('Select Video'),
                // ),
                ElevatedButton(
                  onPressed: _pickMultiImages,
                  child: const Text('Select Multi Images'),
                ),
                // ElevatedButton(
                //   onPressed: _getImgFile,
                //   child: const Text('Get Image File'),
                // ),
                // ElevatedButton(
                //   onPressed: _getImgInfo,
                //   child: const Text('Get Image Info'),
                // ),
              ]),
    //                       Row(
    //                         children: [
    //                           ElevatedButton.icon(
    //                             style: TextButton.styleFrom(
    //                               backgroundColor: camerabtn,
    //                               padding: EdgeInsets.symmetric(
    //                                 horizontal: defaultPadding * 1.5,
    //                                 vertical: defaultPadding /
    //                                     (Responsive.isMobile(context) ? 2 : 1),
    //                               ),
    //                             ),
    //                             onPressed: () {
                              
    // }

    //                             },
    //                             icon: Icon(Icons.camera,
    //                             color: camerabtnlayout,
    //                             ),
    //                             label: Text(""),
    //                           ),
    //                         ],
    //                       ),

                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Product Name",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: tproductname,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.grey[800]),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                //labelText: 'Email Address',
                                labelStyle: TextStyle(
                                    fontSize: 55, color: Colors.black),
                                focusedBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey[700]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  //borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 2.0,
                                  ),
                                ),
                                //filled: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              FutureBuilder(
                                future: _future,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  return snapshot.hasData
                                      ? Container(
                                          width: 300,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1,
                                                  style: BorderStyle.solid)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                selectedText ??
                                                    'Make a selection',
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 13),
                                              ),
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.black,
                                              ),
                                              iconSize: 20,
                                              items: snapshot.data!.result.map<
                                                      DropdownMenuItem<String>>(
                                                  (item) {
                                                return DropdownMenuItem<String>(
                                                  value: item.categoryid
                                                      .toString(),
                                                  child: Text(
                                                    item.categoryname,
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedvalue = value;
                                                  var record = snapshot
                                                      .data!.result
                                                      .where((item) =>
                                                          item.categoryid ==
                                                          int.parse(value!))
                                                      .toList();
                                                  selectedText = record[0]
                                                      .categoryname
                                                      .toString();
                                                  print(selectedvalue);
                                                  print(selectedText);
                                                  getsub(int.parse(
                                                      selectedvalue!));
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(
                                          child: Center(
                                            child: Text('Loading...'),
                                          ),
                                        );
                                },
                              ),
                              Text(
                                "Product Worth",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: tproductworth,
                                  // initialValue: model.categorydescription,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey[800]),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    //labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                        fontSize: 55, color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700]!,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    //filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Open To",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 16),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  width: 300,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: colormain)),
                                  child: ListView.builder(
                                      itemCount: subcatlist!.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int index) {
                                        return CheckboxListTile(
                                          activeColor: secondaryColor,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          // selectedTileColor:colormain.withOpacity(0.5) ,
                                          dense: true,
                                          //font change
                                          title: new Text(
                                            subcatlist![index].categoryname,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5),
                                          ),
                                          value: subcatlist![index].value,
                                          onChanged: (val) {
                                            setState(() {
                                              subcatlist![index].value = val!;

                                              if (val == true) {
                                                newopenTo!.add(
                                                  {
                                                    "categoryid":
                                                        subcatlist![index]
                                                            .categoryid,
                                                    "OpenTo": subcatlist![index]
                                                        .opentoId
                                                  },
                                                );
                                              } else {
                                                newopenTo!.removeWhere((item) =>
                                                    item["categoryid"] ==
                                                    subcatlist![index]
                                                        .categoryid);
                                              }

                                              print(newopenTo!.toList());
                                            });
                                          },
                                        );
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Product Tags",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: tproducttags,
                                  // initialValue: model.categorydescription,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey[800]),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    //labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                        fontSize: 55, color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700]!,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    //filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: tproductdescription,
                                  // initialValue: model.categorydescription,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey[800]),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    //labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                        fontSize: 55, color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700]!,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    //filled: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Attachments",
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(color: colormain)),
                              child: ListView.builder(
                                  itemCount: model.attachments.length,
                                  itemBuilder: (BuildContext ctxt, int index) {
                                    return Container(
                                      child: CheckboxListTile(
                                          activeColor: secondaryColor,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          dense: true,
                                          //font change
                                          title: new Text(
                                            model.attachments[index].attachId
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 0.5),
                                          ),
                                          value:
                                              _attachmentchecked![index].value,
                                          secondary: Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.network(
                                                  'http://${BASEURL.baseurl}/${_attachmentchecked![index].name}')),
                                          onChanged: (val) {
                                            setState(() {
                                              _attachmentchecked![index].value =
                                                  val!;

                                              print(_attachmentchecked![index]
                                                  .id);

                                              print(_attachmentchecked![index]
                                                  .value);
                                            });
                                          }),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(height: 10),

                          ////Button Continue
                          SizedBox(
                            height: 40,
                            width: 400,
                            child: ElevatedButton(
                              onPressed: () async {
                                var modelVm = ProductVm(
                                    id: model.id,
                                    categoryId: int.parse(selectedvalue!),
                                    productName: tproductname.text,
                                    productdescription:
                                        tproductdescription.text,
                                    producttags: tproducttags.text,
                                    productWorth: int.parse(tproductworth.text),
                                    productOpenTo: newopenTo!,
                                    // file: file,
                                    // deletedopento: model.productOpenTo,
                                    // deletedattachments: model.productOpenTo,
                                    attachments: _attachmentchecked!);

                                ProductController().updateProduct(
                                  // mainContext,
                                  context,
                                  modelVm,
                                  newtoken!,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: colormain, onPrimary: Colors.white),
                              child: Text("Submit"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ]),
          ),
        ]);
  }

  dynamic chkmatchsubcategory(int? id) {
    if (id == 0) {
      return null;
    }
    var data =
        _opentoChecked!.firstWhereOrNull((item) => item.categoryid == id);
    // ignore: unnecessary_null_comparison
    if (data == null) {
      return data;
    } else {
      return data;
    }
  }

  Future<dynamic> getsub(int id) {
    Future? _getsubfuture;

    _getsubfuture = CategoryController()
        .getsubcatlist(newtoken!, id)
        .then((value) => setState(() {
              subcatlist = value.result
                  .map((e) => SubCategoryCheckedModel(
                      opentoId: null,
                      categoryid: e.categoryid,
                      categoryname: e.categoryname,
                      // categorydescription: e.categorydescription,
                      // imagepath: e.imagepath,
                      value: false))
                  .toList();
              for (var item in subcatlist!) {
                flag = chkmatchsubcategory(item.categoryid);
                if (flag == null) {
                  item.value = false;
                } else {
                  item.value = true;
                  item.opentoId = flag.opentoId;
                }
              }
            }));
    return _getsubfuture;
  }
  Future<void> _pickImage() async {
    Object? fromPicker =
        await ImagePickerWeb.getImage(outputType: ImageType.widget);

    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
      });
    }
  }

  Future<void> _getImgFile() async {
    Object? infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    setState(() => _imageInfo =
        'Name: ${infos}\nRelative Path: ${infos!}');
  }
  Future<void> _pickMultiImages() async {
    List? images =
        await ImagePickerWeb.getMultiImages(outputType: ImageType.widget);
    setState(() {
      _pickedImages.clear();
      if (images != null) _pickedImages.addAll(images);
    });
  }
   
}


    // Flexible(
                          //   child:
                          // ),

                          // secondary: Container(
                          //   height: 50,
                          //   width: 50,
                          //   child: Image.asset(
                          //     checkBoxListTileModel[index].img,
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),

                          //                               // return new Text(
                          //  model.productOpenTo[index].categoryName
                          //       .toString(),
                          //   style: TextStyle(
                          //       color: Colors.grey[600], fontSize: 13),
                          // );
                          //  new Text(model.productOpenTo[index].categoryName,
                          //   style: TextStyle(
                          //  color: Colors.grey[600],
                          //   fontSize: 13),
                          //  ),

                           // Expanded(

                          //     child: DropZoneWidget(
                          //       onDroppedFile: (file) =>
                          //           setState(() => this.file = file.toList()),
                          //     ),

                          // ),

                          // SizedBox(
                          //   height: 20,
                          // ),
                          // Flexible(
                          //   child: DroppedFileWidget(file: file),
                          // ),
