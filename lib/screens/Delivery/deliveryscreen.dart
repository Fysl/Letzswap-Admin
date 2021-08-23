import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categoryVm.dart';
import 'package:letzswap_dashboard/models/categoriesmodels/categorymodel.dart';
import 'package:letzswap_dashboard/models/deliverymodel/deliverymodel.dart';
import 'package:letzswap_dashboard/models/exchange/exchangemodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/screens/categories/components/form.category.dart';
import 'package:letzswap_dashboard/screens/categories/components/subcatform.category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../responsive.dart';
 
class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({ Key? key }) : super(key: key);

  @override
  _DeliveryScreenState createState() => _DeliveryScreenState();
}


class _DeliveryScreenState extends State<DeliveryScreen> {
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

  
  
Future<DeliveryModel> getdeliverylist() async {

    final queryParameters = {
  'pageNo': "0",
  
};
var newUrl=Uri.http(BASEURL.baseurl,"/api/Delivery/GetAllExchangeDeliveryList",queryParameters);
 
    final response = await get(
        newUrl, headers: {
       
        'Authorization': 'Bearer ${token!.result.accessToken}',
     
    });
 
    if (response.statusCode == 200) {
     var res= json.decode(response.body);
 
   var model =DeliveryModel.fromJson(res);
   data.add(model.result);
   print(data);
     
      // .toList();
    //  var model= CategoryModel.fromJson(res);
   
      print("Delivery List Loaded");
     return model;


    } else {
         print("Error in Delivery List Loaded");
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
               
                  ],
                ),
                Text(
                  "Delivery",
                  style: TextStyle(color: bgColor),
                ),
                SizedBox(height: 15,),
                Flexible(
                  child: FutureBuilder<DeliveryModel>(
                future: getdeliverylist(),
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
                                'TypeId',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Timeline',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'CoordinateId',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Description',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'CurrencyType',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Amount',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Payment',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                             DataColumn(
                              label: Text(
                                'Status',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'IsActive',
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
                                 DataCell(Text('${e.typeid}')),
                                   DataCell(Text('${e.timeline}')),
                                    DataCell(Text('${e.coordinateid}')),
                                    DataCell(Text('${e.description}')),
                                     DataCell(Text('${e.currencytype}')),
                                      DataCell(Text('${e.amount}')),
                                       DataCell(Text('${e.payment}')),
                                     DataCell(Text('${e.status}')),
                                      DataCell(Text('${e.isactive}')),
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