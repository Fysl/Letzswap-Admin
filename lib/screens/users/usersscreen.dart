import 'dart:convert';
import 'dart:io';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/controllers/UserController.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/usermodel/cityCountryVm.dart';
import 'package:letzswap_dashboard/models/usermodel/userVm.dart';
import 'package:letzswap_dashboard/models/usermodel/usermodel.dart';
import 'package:letzswap_dashboard/components/side_menu.dart';
import 'package:letzswap_dashboard/screens/users/component/updateuser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../responsive.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? newtoken;

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

  Future<UserModel> getUserList() async {
    var newUrl = Uri.http(BASEURL.baseurl, "/api/profile/ProfileList");
    final response = await get(newUrl, headers: {
      'Authorization': 'Bearer ${newtoken}',
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      var model = UserModel.fromJson(res);

      print("User List Loaded");
      return model;
    } else {
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //First Row
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: colorChartDownloadMain,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("All Users"), Text("(12K)")],
                    // style: TextStyle(color: secondaryColor),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: bgColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Active Users",
                        style: TextStyle(color: secondaryColor),
                      ),
                      Text(
                        "(12K)",
                        style: TextStyle(color: secondaryColor),
                      )
                    ],
                    // style: TextStyle(color: secondaryColor),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: bgColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "In Active Users",
                        style: TextStyle(color: secondaryColor),
                      ),
                      Text(
                        "(12K)",
                        style: TextStyle(color: secondaryColor),
                      )
                    ],
                    // style: TextStyle(color: secondaryColor),
                  ),
                ),
              ),
              SizedBox(width: 350),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Blocked Users",
                        style: TextStyle(color: secondaryColor),
                      ),
                      Text(
                        "(12K)",
                        style: TextStyle(color: secondaryColor),
                      )
                    ],
                    // style: TextStyle(color: secondaryColor),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          //Search Filter Row
          Row(
            children: [
              Container(
                height: 50,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: bgColor,
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 20,
                        width: 40,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        decoration: BoxDecoration(
                          color: colormain,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: bgColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.sort,
                  color: secondaryColor,
                ),
                label: Text(
                  "Sorting",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: bgColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list,
                  color: secondaryColor,
                ),
                label: Text(
                  "Filter",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
              SizedBox(
                width: 350,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: colorChartUserStatIndicator,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.insights),
                label: Text("Insights"),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: colormain,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.file_download),
                label: Text("Export"),
              ),
            ],
          ),
          Text(
            "Users List",
            style: TextStyle(color: bgColor),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
              child: FutureBuilder<UserModel>(
            future: getUserList(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        sortAscending: true,
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.withOpacity(0.5)),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'User Id',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Email',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'User Name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Gender',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Full Name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Mobile No',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Date Of Birth',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'County',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'City',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Image Location',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Is Deleted',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Is Active',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: snapShot.data!.result.map<DataRow>((e) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Text('${e.id}')),
                              DataCell(Text('${e.email}')),
                              DataCell(Text('${e.userName}')),
                              DataCell(Text('${e.profileGender}')),
                              DataCell(Text('${e.fullname}')),
                              DataCell(Text('${e.mobileNumber}')),
                              DataCell(Text('${e.dateofBirth}')),
                              DataCell(Text('${e.county}')),
                              DataCell(Text('${e.city}')),
                              DataCell(Text('${e.image}')),
                              DataCell(Text('${e.isdeleted}')),
                              DataCell(Text('${e.isactive}')),
                              DataCell(Row(
                                children: [
                                  TextButton.icon(
                                    icon: Icon(
                                      Icons.more_vert,
                                      color: secondaryColor,
                                    ),
                                    label: Text(''),
                                    onPressed: () {
                                      showMenu(
                                        color: bgColor,
                                        context: context,
                                        position: RelativeRect.fromLTRB(
                                            180, 180, 0.0, 0.0),
                                        items: [
                                          PopupMenuItem<String>(
                                            child: TextButton.icon(
                                              icon: Icon(Icons.block),
                                              label: Text('Block User'),
                                              onPressed: () {
                                                UserController()
                                                    .userrequestStatus(
                                                        e.id, false, newtoken!).whenComplete(() => 
                                                        setState(() {
                                                  
                                                })
                                                        );
                                              },
                                            ),
                                          ),
                                          PopupMenuItem<String>(
                                              child: TextButton.icon(
                                            icon: Icon(Icons.edit),
                                            label: Text('Edit'),
                                            onPressed: () {
                                              UserVM vmModel = new UserVM(
                                                  id: e.id,
                                                  email: e.email,
                                                  userName: e.userName,
                                                  isactive: e.isactive,
                                                  fullname: e.fullname,
                                                  profileGender:
                                                      e.profileGender,
                                                  mobileNumber: e.mobileNumber,
                                                  image: e.image,
                                                  cityId: e.city,
                                                  dateofBirth: e.dateofBirth);
                                              showDialog(
                                                  context: context,
                                                  builder: (_) {
                                                    return ProfileUpdate(
                                                        vModel: vmModel,
                                                        token: newtoken!);
                                                  });
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           ProfileUpdate(
                                              //               vModel: vmModel,
                                              //               token: newtoken!)),
                                              // );
                                              //  UserrequestStatus(e.id,false, newtoken!);
                                            },
                                          )),
                                        ],
                                        elevation: 8.0,
                                      );
                                    },
                                  ),
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ));
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
        ]));
  }
}
