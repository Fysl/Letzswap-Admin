import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
 
import 'package:letzswap_dashboard/models/feedbackmodel/ratingmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../responsive.dart';

class FeedBackScreen extends StatefulWidget {
  
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
   SigninModel? token;
   String? NewToken;
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

Future<RatingModel> getFeedbackList() async {
  String flag="All";
    final queryParameters = {
  'Flag': flag,
  
};
 
    var newUrl = Uri.http(BASEURL.baseurl,"/api/Feedback/GetReviews",queryParameters);
    final response = await http.get(
        newUrl, headers: {
       
        'Authorization': 'Bearer ${token!.result.accessToken}',
        'Accept': 'application/json',
        'Content-type': 'application/json',
        
  
    },
    
    );
 
    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      var model = RatingModel.fromJson(res);

      // .toList();
      //  var model= CategoryModel.fromJson(res);

      print("Feeback Rating List Loaded");
      return model;
    } else {
      print("Error in Feeback List Loaded");
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
          //Rating Chart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "5",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "(136K Rating Overall)",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "Excellent",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 15, top: 15),
                          child: LinearPercentIndicator(
                            width: 200.0,
                            lineHeight: 13.0,
                            backgroundColor: progress,
                            percent: 1.0,
                            progressColor: Excellent,
                          )),
                    ],
                  ),

                  // Padding(
                  //   padding: EdgeInsets.only(left: 3.0.w, top: 1.h),
                  //   child: Container(
                  //       child: FAProgressBar(
                  //     border: Border.all(color: Colors.black),
                  //     changeColorValue: 0,
                  //     backgroundColor: Colors.grey[200],
                  //     //changeProgressColor: const Color(0xFFFA7268),
                  //     currentValue: 95,
                  //     displayText: '%',
                  //   )),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "Good",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 43, top: 15),
                          child: LinearPercentIndicator(
                            width: 200.0,
                            lineHeight: 13.0,
                            backgroundColor: progress,
                            percent: 0.8,
                            progressColor: good,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "Average",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 23, top: 15),
                          child: LinearPercentIndicator(
                              width: 200.0,
                              lineHeight: 13.0,
                              backgroundColor: progress,
                              percent: 0.6,
                              progressColor: ratingcolor)),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          "Bad",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 50, top: 15),
                          child: LinearPercentIndicator(
                            width: 200.0,
                            lineHeight: 13.0,
                            backgroundColor: progress,
                            percent: 0.3,
                            progressColor: Colors.red,
                          )),
                    ],
                  ),
                ],
              ),

              //Card Box Column
              Container(
                width: 200,
                height: 350,
                //  decoration:
                //             BoxDecoration(  border: Border.all(
                //             color: Colors.grey,
                //           )),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: bgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(children: [
                        (SizedBox(
                          child: Text(
                            "App",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                          ),
                        )),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: CircleAvatar(
                            backgroundColor: belowaverage,
                            radius: 30.0,
                            child: Text("4.8"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          itemSize: 20,
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        color: bgColor,
                        // border: Border.all(
                        //   color: Colors.grey,
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          (SizedBox(
                            child: Text(
                              "Delivery",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                            ),
                          )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: colorChartUserStatIndicator,
                              child: Text("4.4"),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Wrap(children: [
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

               ],),
      
              Wrap(children: [
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
                onPressed: () {
                  //  Navigator.pushReplacement(
                  //    context,
                  //    MaterialPageRoute(builder: (context) => CreateMainCategory()),
                  //       );
                },
                icon: Icon(Icons.add),
                label: Text("Any"),
              ),

              ],),
             
            ],
          ),
          Text(
            "Rating List",
            style: TextStyle(color: secondaryColor),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
              child: FutureBuilder<RatingModel>(
            future: getFeedbackList(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey),
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Id',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'UserId',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'UserName',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Rating',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Type',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'CommentId',
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
                            'Is Deleted',
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
                            DataCell(Text(e.id.toString())),
                            DataCell(Text('${e.userid}')),
                            DataCell(Text('${e.username}')),
                                DataCell(Text('${e.rating}')),
                            DataCell(Text('${e.type}')),
                            DataCell(Text('${e.commentid}')),
                            DataCell(Text('${e.isactive}')),
                            DataCell(Text('${e.isdeleted}')),
                            DataCell(TextButton.icon(
                              icon: Icon(Icons.edit),
                              label: Text(''),
                              onPressed: () {
                                //          CategoryVm vm = new CategoryVm(categoryid: e.categoryid, categoryname: e.categoryname, categorydescription: e.categorydescription, imagepath: e.imagepath.toString());
                                // //           showDialog(
                                // context: context,
                                // builder: (_) {
                                //   return   UpdateCategory(model: vm,);
                                // });

                                //               Navigator.push(
                                // context,
                                // MaterialPageRoute(builder: (context) => UpdateCategory(model: vm,)));
                              },
                            )),

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
                  ),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
        ]));
  }
}
