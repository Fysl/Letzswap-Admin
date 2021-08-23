import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/controllers/categorycontroller.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class UpdateCategory extends StatefulWidget {
  final CategoryVm model;

  const UpdateCategory({Key? key, required this.model}) : super(key: key);
  @override
  _UpdateCategoryState createState() => _UpdateCategoryState(model: model);
}

class _UpdateCategoryState extends State<UpdateCategory> {
  CategoryVm model;
  _UpdateCategoryState({required this.model});
  final _formKey = GlobalKey<FormState>();

  String? newtoken;
  TextEditingController tupcategoryname = new TextEditingController();
  TextEditingController tupcatdescription = new TextEditingController();
  TextEditingController tupcatimage = new TextEditingController();

  @override
  void initState() {
    setState(() {
      tupcategoryname.text = model.categoryname;
      tupcatdescription.text = model.categorydescription;
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
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Update Category",
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
        // drawer: SideMenu(),
        // body: SafeArea(
        children: <Widget>[

          
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (Responsive.isDesktop(context))
              // Expanded(
              //   child: SideMenu(),
              // ),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [                        
                            Center(                    
                       child: Container(
                         width: 100,
                         height: 100,
                         child: ClipRRect(
         borderRadius: new BorderRadius.circular(30.0),
         child: Image.network('http://${BASEURL.baseurl}/${model.imagepath}', 
                                  fit: BoxFit.cover, 
                                  height: 20.0, width: 20.0)),
                       ),
                     ),
                          SizedBox(height: 15),
                          Text(
                            "Category Name",
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
                              controller: tupcategoryname,
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
                              //                                    onChanged: (newText) {
                              //    tcategoryname.text = newText;
                              //   setState((){

                              //   });
                              // },
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
                              controller: tupcatdescription,
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

                          SizedBox(height: 10),
                          ////Button Continue
                          SizedBox(
                            height: 40,
                            width: 400,
                            child: ElevatedButton(
                              onPressed: () async {
                                // if (_formKey.currentState!.validate()) {

                                var modelVm = CategoryVm(
                                    categoryid: model.categoryid,
                                    categoryname: tupcategoryname.text,
                                    categorydescription: tupcatdescription.text,
                                    imagepath: tupcatimage.toString());

                                CategoryController().updatecategory(
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
              ),
          ]),
        ]);
    // );
  }
}
