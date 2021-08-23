import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/controllers/UserController.dart';
import 'package:letzswap_dashboard/controllers/locationcontroller.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signinmodel.dart';
import 'package:letzswap_dashboard/models/usermodel/userVm.dart';
import 'package:letzswap_dashboard/responsive.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_validator/the_validator.dart';

class ProfileUpdate extends StatefulWidget {
  final UserVM vModel;
  final String? token;
  const ProfileUpdate({Key? key, required this.vModel, this.token})
      : super(key: key);

  @override
  _ProfileUpdateState createState() =>
      _ProfileUpdateState(vModel: vModel, token: token);
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  String? token;
  UserVM vModel;
  final _formKey = GlobalKey<FormState>();
  _ProfileUpdateState({required this.vModel, required this.token});

//  String? newtoken;
  DateTime? _selectedDate;
  String? newId;
  String? selectedvalue;
  String? selectedText;
  Future? _future;
  String? imageprofile;
  // Future<List>? _citylist;
    Future<dynamic>? _futurecity;
  

  final ImagePicker _picker = ImagePicker();
  TextEditingController temail = new TextEditingController();
  TextEditingController tmobilenumber = new TextEditingController();
  TextEditingController tusername = new TextEditingController();
  TextEditingController tfullname = new TextEditingController();
   
  TextEditingController tgender = new TextEditingController();
  TextEditingController tdateofbirth = new TextEditingController();

  // TextEditingController tcategorytype = new TextEditingController();

  @override
  void initState() {
    setState(() {
      _future = LocationController().getCities(token!, 1);
     _futurecity=UserController().getCityById(token!,vModel.cityId!).then((value) => 
    selectedText=value.cityName
    );
      tusername.text = vModel.userName;
      temail.text = vModel.email;
      tfullname.text = vModel.fullname;
      tgender.text = vModel.profileGender;
       
      tdateofbirth.text = vModel.dateofBirth;
      tmobilenumber.text = vModel.mobileNumber.toString();
       
        imageprofile=vModel.image.split("~/")[1];
      
        
       selectedvalue=vModel.cityId.toString(); 
       

      print(token);
      print('profile Update Initialize');
      //  gettoken();
    });
    super.initState();
  }

//     gettoken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    newtoken = sharedPreferences.getString("token");
//    SigninModel gettoken =SigninModel.fromJsonModel(jsonDecode(newtoken!));
//     newtoken   = gettoken.result.accessToken.toString();

//     //  var result =  UserController.getUserById(ProfileUpdate.id, newtoken!);

// }

  @override
  Widget build(BuildContext mainContext) {
//     return Scaffold(
      
//       body: SafeArea(
//         child: 
//       ),
//     );
//   }
// }
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
         
        children: <Widget>[
Row(
  mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(width: 10,),
          // Expanded(
          //   // default flex = 1
          //   // and it takes 1/6 part of the screen
          //   child: SizedBox(
          //     width: 50,
          //   ),
          // ),
          Expanded(
            flex: 4,
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
         child: Image.network('http://${BASEURL.baseurl}/$imageprofile', 
                                  fit: BoxFit.cover, 
                                  height: 20.0, width: 20.0)),
                       ),
                     ),
                    Text(
                      "Email_Address",
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
                        controller: temail,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[800]),
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
                        onChanged: (String value) {
                          vModel.email = value;
                        },
                      ),
                    ),
                    Text(
                      "Mobile_Number",
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
                        controller: tmobilenumber,
                        // keyboardType: TextInputType.number,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[800]),
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
                        onChanged: (String value) {
                          vModel.mobileNumber = value;
                        },
                      ),
                    ),
                    Text(
                      "User Name",
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
                        controller: tusername,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[800]),
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
                        onChanged: (String value) {
                          vModel.userName = value;
                        },
                      ),
                    ),
                    Text(
                      "Fullname",
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
                        controller: tfullname,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[800]),
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
                        onChanged: (String value) {
                          vModel.fullname = value;
                        },
                      ),
                    ),
                    // Text(
                    //   "Title",
                    //   style: TextStyle(
                    //       color: Colors.grey[800],
                    //       fontSize: 12,
                    //       fontWeight: FontWeight.normal),
                    // ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // SizedBox(
                    //   width: 400,
                    //   child: TextFormField(
                    //     controller: ttitle,
                    //     textAlign: TextAlign.left,
                    //     style:
                    //         TextStyle(fontSize: 13.0, color: Colors.grey[800]),
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(horizontal: 10.0),
                    //       //labelText: 'Email Address',
                    //       labelStyle:
                    //           TextStyle(fontSize: 55, color: Colors.black),
                    //       focusedBorder: OutlineInputBorder(
                    //         //borderRadius: BorderRadius.circular(25.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.grey[700]!,
                    //         ),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         //borderRadius: BorderRadius.circular(25.0),
                    //         borderSide: BorderSide(
                    //           color: Colors.grey[300]!,
                    //           width: 2.0,
                    //         ),
                    //       ),
                    //       //filled: true,
                    //     ),
                    //     onChanged: (String value) {
                    //       vModel.title = value;
                    //     },
                    //   ),
                    // ),
                    Text(
                      "Gender",
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
                        controller: tgender,
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 13.0, color: Colors.grey[800]),
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
                        onChanged: (String value) {
                          vModel.profileGender = value;
                        },
                      ),
                    ),
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: tdateofbirth,
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
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now().toLocal(),
                                  builder: (context, picker) {
                                    return Theme(
                                      data: ThemeData.dark().copyWith(
                                        colorScheme: ColorScheme.dark(
                                          primary: Colors.deepPurple,
                                          onPrimary: Colors.white,
                                          surface: colormain,
                                          onSurface: bgColor,
                                        ),
                                        dialogBackgroundColor: secondaryColor,
                                      ),
                                      child: picker!,
                                    );
                                  }).then((_selectedDate) {
                                if (_selectedDate != null) {
                                  setState(() {
                                    tdateofbirth.text =
                                        _selectedDate.toString();
                                    vModel.dateofBirth =
                                        _selectedDate.toString();
                                  });
                                }
                              });
                            },
                            child: Text("Select"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cities",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FutureBuilder(
                      future: _future,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return snapshot.hasData
                            ? Container(
                                child: DropdownButton<String>(
                                  hint: Text(
                                    selectedText ?? 'Make a selection',
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 13),
                                  ),
                                  items: snapshot.data!.result
                                      .map<DropdownMenuItem<String>>((item) {
                                    return DropdownMenuItem<String>(
                                      value: item.id.toString(),
                                      child: Text(
                                        item.name,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedvalue = value;
                                      var record = snapshot.data!.result
                                          .where((item) =>
                                              item.id == int.parse(value!))
                                          .toList();
                                      selectedText = record[0].name.toString();
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

                    SizedBox(height: 20),
                    ////Button Continue
                    SizedBox(
                      height: 40,
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            UserController().postprofileupdate(
                              mainContext,
                              vModel,
                              token!,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: colormain, onPrimary: Colors.white),
                        child: Text("Update"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),


         ]);
  }
}
