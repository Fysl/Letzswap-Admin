import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/bookmarkmodel/bookmarkModel.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/screens/categories/components/form.category.dart';
import 'package:letzswap_dashboard/screens/categories/components/subcatform.category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../responsive.dart';
 
 
class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({ Key? key }) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}


class _BookmarkScreenState extends State<BookmarkScreen> {
    SigninModel? token;
      List<dynamic> data =[];
  
@override
  void initState() {
    setState(() {
     gettoken();
    });
    super.initState();
  }
    
    gettoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? newtoken = sharedPreferences.getString("token");
    setState(() {
      token = SigninModel.fromJsonModel(jsonDecode(newtoken!));
  //  resulttoken=token!.result.accessToken;
      
    });
  }

  
  
Future<BookmarkModel> getBookMarks(String? UserId ,int? productId, int?PageNo,int?PageSize) async {

    final queryParameters = {
  'UserId': UserId.toString(),
  'productId': productId.toString(),
  'PageNo': PageNo.toString(),
  'PageSize': PageSize.toString(),
};
var newUrl=Uri.http(BASEURL.baseurl,"/api/bookmarks/GetBookmarkslist");
 
    final response = await get(
        newUrl, headers: {
      //  HttpHeaders.authorizationHeader: 'Bearer $token',
        'Authorization': 'Bearer ${token!.result.accessToken}',
    
    });
 
    if (response.statusCode == 200) {
     var res= json.decode(response.body);
 
   var model =BookmarkModel.fromJson(res); 
      print("Bookmark List Loaded");
     return model;


    } else {
         print("Error in Bookmark List Loaded");
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
                      width: 50,
                    ),
                    // ElevatedButton.icon(
                    //   style: TextButton.styleFrom(
                    //     backgroundColor: colorChartUserStatIndicator,
                    //     padding: EdgeInsets.symmetric(
                    //       horizontal: defaultPadding * 1.5,
                    //       vertical:
                    //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                    //     ),
                    //   ),
                    //   onPressed: () {},
                    //   icon: Icon(Icons.insights),
                    //   label: Text("Insights"),
                    // ),
                    SizedBox(
                      width: 20,
                    ),
                    
                    
                  ],
                ),
                Text(
                  "Bookmark List",
                  style: TextStyle(color: bgColor),
                ),
                SizedBox(height: 15,),
                Flexible(
                  child: FutureBuilder<BookmarkModel>(
                future: getBookMarks(null,null,null,null),
                builder: (context, snapShot) {
                 
                  if (snapShot.hasData) {
                    return SingleChildScrollView(
                       scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          headingRowColor:
                            MaterialStateColor.resolveWith((states) =>  Colors.grey.withOpacity(0.5)),
                        columns: <DataColumn>[
                          // DataColumn(
                          //   label: Text(
                          //     'Book Id',
                          //     style: TextStyle(fontStyle: FontStyle.italic),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'ProductId',
                          //     style: TextStyle(fontStyle: FontStyle.italic),
                          //   ),
                          // ),
                          // DataColumn(
                          //   label: Text(
                          //     'Booker Id',
                          //     style: TextStyle(fontStyle: FontStyle.italic),
                          //   ),
                          // ),
                          DataColumn(
                            label: Text(
                              'ProductName',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                            DataColumn(
                            label: Text(
                              'CategoryName',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                            DataColumn(
                            label: Text(
                              'BookedBy',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                            DataColumn(
                            label: Text(
                              'ProductUser',
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
                                // DataCell(Text(e.bookid.toString())), 
                                //  DataCell(Text(e.productid.toString())), 
                                //   DataCell(Text(e.userid.toString())), 
                                   DataCell(Text(e.productName.toString())), 
                                    DataCell(Text(e.categoryName.toString())), 
                                     DataCell(Text(e.bookedby.toString())), 
                                      DataCell(Text(e.productuser.toString())), 
                              
                              DataCell(TextButton.icon(
                  icon: Icon(Icons.delete),
                  label: Text(''),
                  onPressed: () {   
              //  CategoryVm vm = new CategoryVm(categoryid: e.categoryid, categoryname: e.categoryname, categorydescription: e.categorydescription, imagepath: e.imagepath.toString());

        //               Navigator.push(
        // context,
        // MaterialPageRoute(builder: (context) => UpdateCategory(model: vm,)));          
                  },
                )
                ),
 
                //            DataCell(TextButton.icon(
                //   icon: Icon(Icons.delete),
                //   label: Text(''),
                //   onPressed: () {   
                   
                //   },
                // )),
                            ],
                          );
                        }).toList(),
                      ),
                    ));
                  }else{
                    return CircularProgressIndicator();
                  }
                },
              )),
               
              ]
              
              )
      
    );
  }
}