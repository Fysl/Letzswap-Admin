import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/controllers/UserController.dart';
import 'package:letzswap_dashboard/controllers/categorycontroller.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/responsive.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';

class CreateSubCategory extends StatefulWidget {
  final String? newtoken;
  const CreateSubCategory({Key? key,required this.newtoken}) : super(key: key);
 
  @override
  _CreateSubCategoryState createState() => _CreateSubCategoryState(newtoken: newtoken);
}

class _CreateSubCategoryState extends State<CreateSubCategory> {
 
  final _formKey = GlobalKey<FormState>();
  _CreateSubCategoryState({this.newtoken});
  String? newtoken;
 String? selectedvalue;
  String? selectedText;
    // Future? _future;

  final focustext = FocusNode();
  TextEditingController tsubcategoryname = new TextEditingController();
  TextEditingController tdescription = new TextEditingController();

  @override
  void initState() {
    selectedText="Select";
       selectedvalue="1";
    setState(() {
      // gettoken();
        // _future=
      
    });
    super.initState();
  }

  // gettoken() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   newtoken = sharedPreferences.getString("token");
  //   SigninModel gettoken = SigninModel.fromJsonModel(jsonDecode(newtoken!));
  //   newtoken = gettoken.result.accessToken.toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (Responsive.isDesktop(context))
            Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
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
                      Text(
                        "Categories",
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
                          controller: tsubcategoryname,
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
                        "Sub category Name",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                        SizedBox(
                        height: 8,
                      ),
                FutureBuilder(
        future: CategoryController().getcatById(newtoken!),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Container(
                  child: DropdownButton<String>(
                    hint: Text(selectedText ?? 'Make a selection',
                     style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 13),
                 
                    ),
                    items: snapshot.data!.result.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem<String>(
                        value: item.categoryid.toString(),
                        child: Text(item.categoryname,                                      
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedvalue = value;
                        var record=snapshot.data!.result.where((item) => item.categoryid == int.parse(value!)).toList();
                        selectedText=record[0].categoryname.toString();                     
                        print(selectedvalue);
                        print(selectedText);
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

                      SizedBox(height: 10),
                      ////Button Continue
                      SizedBox(
                        height: 40,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              CategoryController().postmaincategory(
                                context,
                                tsubcategoryname.text.trim(),
                                tdescription.text.trim(),
                                int.parse(selectedvalue!),
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
          ),
        ]),
      ),
    );
  }
}
