import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/controllers/categoryController.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signinmodel.dart';
import 'package:letzswap_dashboard/responsive.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_validator/the_validator.dart';

class CreateMainCategory extends StatefulWidget {
  @override
  _CreateMainCategoryState createState() => _CreateMainCategoryState();
}

class _CreateMainCategoryState extends State<CreateMainCategory> {
  List<File> multipleimages = [];
  List<String> imagesbs4 = [];
  List<int> check = [];
  String? token;
  bool? dropflag = false;
  int?cattype;
  String? selectedvalue;
  String? selectedText;
  final _formKey = GlobalKey<FormState>();
  String? newtoken;
  final focustext = FocusNode();
  TextEditingController tcategoryname = new TextEditingController();
  TextEditingController tdescription = new TextEditingController();
  // TextEditingController tcategorytype = new TextEditingController();

  // void handleCamera(BuildContext context) async {
  //   Navigator.pop(context);

  //   // await Permission.photos.request();
  //  // var permission = await Permission.photos.status;

  //     // final picker = ImagePicker();
  //     PickedFile? pickedfile = await ImagePicker().getImage(
  //         source: ImageSource.camera!,
  //         imageQuality: 85,
  //         maxHeight: 200,
  //         maxWidth: 200);
  //     var p = pickedfile!.path;
  //     File file = File(pickedfile.path);
  //     // File file = await ImagePicker.platform
  //     //     .pickImage(source: ImageSource.camera, maxHeight: 675, maxWidth: 970)
  //     //     .then((value) => null);
  //     setState(() {
  //       multipleimages.add(file);
  //       imagesbs4.add(file.toString());

  //       // fileimageconvert(file);
  //     });

  //   }

  selectImage(BuildContext parentcontext) {
    return showDialog(
        context: parentcontext,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              "Upload Picture",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
            ),
            children: <Widget>[
              // Icon(MdiIcons.camera, color: Colors.red),
              SimpleDialogOption(
                child: Container(
                  height: 45,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.only(top: 11.0),
                    child: Text("Choose from Gallery",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ),
                onPressed: () => handleGallery(context),
              ),
              SimpleDialogOption(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  color: Colors.grey[400],
                  child: Padding(
                    padding: EdgeInsets.only(top: 11.0),
                    child: Text("Choose from Camera",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                ),
                onPressed: () {},
              ),
              SimpleDialogOption(
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  void handleGallery(BuildContext context) async {
    // Navigator.pop(context);

    PickedFile? pickedfile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxHeight: 200,
        maxWidth: 200);
    var p = pickedfile!.path;
    File file = File(pickedfile.path);

    setState(() {
      multipleimages.add(file);
      imagesbs4.add(file.toString());

      // fileimageconvert(file);
    });

    // final picker = ImagePicker();
    // PickedFile pickedfile = await picker.getImage(source: ImageSource.gallery);
    // file = File(pickedfile.path);
  }

  @override
  void initState() {
    setState(() {
      gettoken();
    });
    super.initState();
  }

  gettoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    newtoken = sharedPreferences.getString("token");
    SigninModel gettoken = SigninModel.fromJsonModel(jsonDecode(newtoken!));
    newtoken = gettoken.result.accessToken.toString();
  }

  @override
  Widget build(BuildContext mainContext) {
    return SimpleDialog(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Create  Category",
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
        children:[
          Padding(
           padding: EdgeInsets.symmetric(horizontal: 100,vertical: 0),
            // semanticContainer: true,
            // clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (Responsive.isDesktop(context))
                Expanded(             
                  child: Container(                  
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: bgColor,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ElevatedButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor: camerabtn,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5,
                                    vertical: defaultPadding /
                                        (Responsive.isMobile(context) ? 2 : 1),
                                  ),
                                ),
                                onPressed: () {
                                  // selectImage(context);
                                  handleGallery(context);
                                },
                                icon: Icon(Icons.camera),
                                label: Text(""),
                              ),
                              // SizedBox(
                              //   width: MediaQuery.of(context).size.width * 0.2,
                              // ),
                            ],
                          ),
                         SizedBox(height: 20,),
                          Text(
                            "Category Name",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormField(
                              controller: tcategoryname,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.grey[800]),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                //labelText: 'Email Address',
                                labelStyle:
                                    TextStyle(fontSize: 55, color: Colors.black),
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
                          Text(
                            "Category Description",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: 400,
                            child: TextFormField(
                              controller: tdescription,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 13.0, color: Colors.grey[800]),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10.0),
                                //labelText: 'Email Address',
                                labelStyle:
                                    TextStyle(fontSize: 55, color: Colors.black),
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
                                "Is Subcategory:",
                                style: TextStyle(
                                    fontSize: 13.0, color: Colors.grey[800]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Checkbox(
                                  value: dropflag,
                                  onChanged: (val) {
                                    setState(() {
                                      dropflag = val;
                                    });
                                  }),
                              SizedBox(
                                width: 20,
                              ),
                              if (dropflag == true) ...[
                                FutureBuilder(
                                  future:
                                      CategoryController().getcatById(newtoken!),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    return snapshot.hasData
                                        ? Container(
                                            child: DropdownButton<String>(
                                              hint: Text(
                                                selectedText ??
                                                    'Make a selection',
                                                style: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 13),
                                              ),
                                              items: snapshot.data!.result
                                                  .map<DropdownMenuItem<String>>(
                                                      (item) {
                                                return DropdownMenuItem<String>(
                                                  value:
                                                      item.categoryid.toString(),
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
                                                });
                                              },
                                            ),
                                          )
                                        : Container(
                                            child: Center(
                                              child: Text('Loading...'),
                                            ),
                                          );
                                  },
                                ),
                              ] else
                                ...[],
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ////Button Continue
                          SizedBox(
                            height: 40,
                            width: 400,
                            child: ElevatedButton(
                              onPressed: () async {
                                
                                if (_formKey.currentState!.validate()) {
                                  if(dropflag==false)
                                  {
                                    cattype = 0;
                                  }
                                  else
                                  {
                                    cattype=int.parse(selectedvalue!);
                                  }
                                  
                                  CategoryController().postmaincategory(
                                    mainContext,
                                    tcategoryname.text.trim(),
                                    tdescription.text.trim(),
                                    cattype!,
                                    newtoken!,
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: colormain, onPrimary: Colors.white),
                              child: Text("Create"),
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

  fileimageconvert(File image) {
    final bytes = File(image.path).readAsBytesSync();

    String img64 = base64Encode(bytes);
    setState(() {
      imagesbs4.add(img64);
    });

    // var addimage = Provider.of<ProfileState>(context, listen: false);
    // addimage.setimage(img64);
    print(img64);
  }
}
